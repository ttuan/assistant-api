# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

bind  "unix:///home/deploy/deployed_folder/shared/tmp/sockets/puma.sock"
pidfile "/home/deploy/deployed_folder/shared/tmp/pids/puma.pid"
state_path "/home/deploy/deployed_folder/shared/tmp/sockets/puma.state"
directory "/home/deploy/deployed_folder/current"

workers 2
threads 1,2

daemonize true

activate_control_app 'unix:///home/deploy/deployed_folder/shared/tmp/sockets/pumactl.sock'

prune_bundler
