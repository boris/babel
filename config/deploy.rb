# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'babel'
set :repo_url, 'git@github.com:boris/babel.git'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true
set :ssh_options, { :forward_agent => true }

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/unicorn.rb', 'db/babel_prod')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:all), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
      execute("sudo service unicorn restart")
    end
  end

end
