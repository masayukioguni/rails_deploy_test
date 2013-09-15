require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "jpa_database"

set :scm, :git
set :repository,  "git@bitbucket.org:masayukioguni/jpa_database.git"

set :use_sudo, false
set :deploy_via, :copy
set :git_shallow_clone, 1

set :user, "deploy"
set :bundle_without, [:test]
#default_run_options[:pty] = true

host =  "ec2-54-200-3-110.us-west-2.compute.amazonaws.com"
role :web, host
role :app, host
role :db,  host, :primary => true

