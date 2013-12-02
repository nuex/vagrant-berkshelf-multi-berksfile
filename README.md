vagrant-berkshelf multivm Berksfile support
===========================================

## Description

This vagrant plugin hacks the vagrant-berkshelf plugin to add support for multiple
Berksfile's for each VM.

This is a temporary solution until [vagrant-berkshelf issue #123](https://github.com/berkshelf/vagrant-berkshelf/issues/123) gets resolved.

## Install

    $ vagrant plugin install vagrant-berkshelf-multi-berksfile

## Usage

In your Vagrantfile

    Vagrant.require_plugin 'vagrant-berkshelf-multi-berksfile'
