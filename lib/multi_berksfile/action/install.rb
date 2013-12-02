module Berkshelf
  module Vagrant
    module Action
      # @author Jamie Winsor <jamie@vialstudios.com>
      class Install
        def call(env)
          if provision_disabled?(env)
            env[:berkshelf].ui.info "Skipping Berkshelf with --no-provision"

            return @app.call(env)
          end

          unless berkshelf_enabled?(env)
            if File.exist?(env[:machine].config.berkshelf.berksfile_path)
              warn_disabled_but_berksfile_exists(env)
            end

            return @app.call(env)
          end

          env[:berkshelf].berksfile = Berkshelf::Berksfile.from_file(env[:machine].config.berkshelf.berksfile_path)
          
          if chef_solo?(env)
            install(env)
          end

          @app.call(env)
        rescue Berkshelf::BerkshelfError => e
          raise Berkshelf::VagrantWrapperError.new(e)
        end

        private

        def install(env)
          check_vagrant_version(env)
          env[:berkshelf].ui.info "Updating Vagrant's berkshelf: '#{env[:berkshelf].shelf}'"
          opts = {
            path: env[:berkshelf].shelf
          }.merge(env[:machine].config.berkshelf.to_hash).symbolize_keys!
          env[:berkshelf].berksfile.install(opts)
        end

        def warn_disabled_but_berksfile_exists(env)
          env[:berkshelf].ui.warn "Berkshelf plugin is disabled but a Berksfile was found at" +
            " your configured path: #{env[:machine].config.berkshelf.berksfile_path}"
          env[:berkshelf].ui.warn "Enable the Berkshelf plugin by setting 'config.berkshelf.enabled = true'" +
            " in your vagrant config"
        end
      end
    end
  end
end
