# set path to application
app_dir = File.expand_path("../../..", __FILE__)
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
