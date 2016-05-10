require 'thor'

module Demae
  class CLI < Thor
    desc 'install', 'create initial config'
    def install
      templates_dir = File.expand_path('../templates', __FILE__)
      config_dir = 'config/demae'
      FileUtils.mkdir_p(config_dir)
      %w(staging production).each do |environment|
        FileUtils.copy("#{templates_dir}/environment.yml", "#{config_dir}/#{environment}.yml")
      end
    end

    desc 'apply', 'apply itamae recipes'
    def apply(environment)
      # TODO: impl
    end
  end
end
