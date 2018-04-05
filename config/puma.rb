# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

bind  "unix:///home/deploy/shared/tmp/sockets/puma.sock"
pidfile "/home/deploy/shared/tmp/pids/puma.pid"
state_path "/home/deploy/shared/tmp/sockets/puma.state"
directory "/home/deploy/current"

workers 2
threads 1,2

daemonize true

activate_control_app 'unix:///home/deploy/shared/tmp/sockets/pumactl.sock'

prune_bundler
