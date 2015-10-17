# set path to application
user = "team_work"
project = "team_work"
app_dir = "/home/#{user}/app/#{project}"
current = "#{app_dir}/current"
shared_dir = "#{app_dir}/shared"
working_directory current


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{current}/log/unicorn.stderr.log"
stdout_path "#{current}/log/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/pids/unicorn.pid"

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end
