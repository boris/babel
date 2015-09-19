# Load DSL and set up stages
require 'bundler/setup'
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'


LIST = YAML.load_file('./config/deploy/config.yml')
require 'capistrano/rails'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }

Rake::Task["deploy:assets:precompile"].clear

namespace :deploy do
  namespace :assets do
    task :precompile do
      on roles(fetch(:assets_roles)) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            # execute :rake, "assets:precompile"
            # this needs to be release path, as precompilation is done before
            # the /current symlink is pointed to the release path
            execute("cd #{release_path} && ~/.rbenv/shims/bundle exec rake assets:precompile RAILS_ENV=#{fetch(:rails_env)}")
          end
        end
      end
    end
  end
end
