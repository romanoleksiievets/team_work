# config valid only for current version of Capistrano
lock '3.4.0'

server '178.62.217.79', roles: [:web, :app, :db], port: fetch(:port), user: fetch(:user), primary: true
set :application, 'team_work'
set :user, 'team_work'
set :scm, "git"
set :repo_url, 'git@github.com:Lyubomyr/team_work.git'
set :deploy_via, :remote_cache
set :port, 22
set :pty, true

set :branch, ENV["REVISION"] || ENV["BRANCH"] || "master"

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_files, fetch(:linked_files, []).push('config/secret.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')
set :ssh_options, { forward_agent: true, auth_methods: %w(publickey), user: fetch(:user) }

before 'deploy', 'rvm1:alias:create'
before 'deploy', 'rvm1:install:gems'
after 'deploy:publishing', 'deploy:restart'
after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
