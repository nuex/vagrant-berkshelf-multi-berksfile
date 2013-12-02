module Berkshelf
  module Vagrant
    # @author Jamie Winsor <jamie@vialstudios.com>
    #
    # A module of common helper functions that can be mixed into Berkshelf::Vagrant actions
    module EnvHelpers

      # Determine if the Berkshelf plugin should be run for the given environment
      #
      # @param [Vagrant::Environment] env
      #
      # @return [Boolean]
      def berkshelf_enabled?(env)
        env[:machine].config.berkshelf.enabled
      end
    end
  end
end
