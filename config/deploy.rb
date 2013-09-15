require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "rails_deploy_test"

set :scm, :git
set :repository,  "https://github.com/masayukioguni/rails_deploy_test.git"

set :use_sudo, true
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :rvm_ruby_string, 'ruby-2.0.0-p247'

set :user, "deploy"
set :bundle_without, [:test]
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

host =  "ec2-54-200-47-184.us-west-2.compute.amazonaws.com"
role :web, host
role :app, host
role :db,  host, :primary => true

