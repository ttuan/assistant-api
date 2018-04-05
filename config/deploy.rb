require 'mina/rails'
require 'mina/bundler'
require 'mina/puma'
require 'mina/git'
require 'mina/rvm'

set :application_name, ENV["APPLICATION_NAME"]
set :user, "deploy"
set :domain, ENV["DOMAIN"]
set :deploy_to, ENV["DEPLOY_PATH"]
set :repository, ENV["GIT_REPO"]
set :branch, ENV["BRANCH"]
set :rails_env, ENV["RAILS_ENV"]
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')

task :remote_environment do
  invoke :'rvm:use', 'ruby-2.5.0'
end

task :setup do
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
  comment "Be sure to edit '#{fetch(:shared_path)}/config/database.yml', 'secrets.yml' and puma.rb."
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    comment "Deploying #{fetch(:application_name)} to #{fetch(:domain)}:#{fetch(:deploy_to)}"
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:phased_restart'
    end
  end
end
