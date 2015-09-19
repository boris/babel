set :stage,      :production
set :rails_env,  'production'
set :branch,     'master'
set :rbenv_ruby, '2.1.0'
set :deploy_to,  '/home/boris/babel'
set :user,       'boris'

user = 'boris'

all = LIST["web"].map { |ip| "#{fetch(:user)}@#{ip}" }

role :app,       all
role :db,        all
