# config valid only for current version of Capistrano
lock '3.4.0'

server '178.62.217.79', roles: [:web, :app, :db], port: fetch(:port), user: fetch(:user), primary: true
set :application, 'team_work'
set :user, 'team_work'
set :scm, "git"
set :repo_url, 'git@github.com:Lyubomyr/team_work.git'
set :deploy_via, :remote_cache
set :port, 22
set :pty, false

set :branch, ENV["REVISION"] || ENV["BRANCH"] || "master"

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, %w{config/database.yml config/unicorn.rb config/secrets.yml}
set :linked_dirs, fetch(:linked_dirs, []) + %w{bin log pids}
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')
set :ssh_options, { forward_agent: true, auth_methods: %w(publickey), user: fetch(:user) }

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  # %w[start stop restart].each do |command|
  #   desc "#{command} unicorn server"
  #   task command do
  #     on roles(:app), except: {no_release: true} do
  #       puts "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
  #       run "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
  #     end
  #   end
  # end
end

before 'deploy', 'rvm1:install:gems'
after "deploy", "deploy:cleanup" # keep only the last 5 releases
after 'deploy:publishing', 'deploy:restart'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
