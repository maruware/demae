require 'thor'
require 'yaml'
require 'itamae/cli'

module Demae
  class CLI < Thor
    CONFIG_DIR = 'config/demae'

    def initialize(*)
      super
      Itamae.logger.level = ::Logger.const_get('INFO')
      Itamae.logger.formatter.colored = true
    end

    desc 'install', 'create initial config file'
    def install
      templates_dir = File.expand_path('../templates', __FILE__)
      FileUtils.mkdir_p(CONFIG_DIR)
      %w(staging production).each do |environment|
        FileUtils.copy("#{templates_dir}/environment.yml", config_path(environment))
      end
    end

    desc 'apply', 'apply itamae recipes to environment'
    def apply(environment)
      run(environment)
    end

    desc 'plan', 'check an execution plan before apply cmd.'
    def plan(environment)
      run(environment, dry_run: true)
    end

    private

    def config_path(environment)
      "#{CONFIG_DIR}/#{environment}.yml"
    end

    def run(environment, dry_run: false)
      config = YAML.load_file(config_path(environment))
      config.each do |server|
        server['hosts'].each do |host|
          options = {
            host: host,
            vagrant: false,
            ask_password: false,
            sudo: true,
            dry_run: dry_run
          }
          o = server.reject { |k, _| %w(hosts recipes).include? k }
          o = o.each_with_object({}) { |(k, v), memo| memo[k.to_sym] = v }
          options.merge!(o)

          runner = Itamae::Runner.run(server['recipes'], :ssh, options)
        end
      end
    end
  end
end
