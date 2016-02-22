# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'twitter_app'
set :repo_url, 'git@github.com:nhattan/twitter_app.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/twitter_app
set :deploy_to, '/var/www/twitter_app'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system',  'public/uploads', 'public/assets')

# Default value for default_env is {}
set :default_env, {
  rails_env: ENV["RAILS_ENV"]
}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc "seed database"
  task :seed do
    on roles(:db) do |host|
      within release_path do
        with rails_env: ENV["RAILS_ENV"] do
          execute :rake, "db:seed"
        end
      end
    end
  end

end
