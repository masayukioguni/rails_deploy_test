require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "rails_deploy_test"

set :scm, :git
set :repository,  "https://github.com/masayukioguni/rails_deploy_test.git"

set :use_sudo, false
set :deploy_via, :copy
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



set :default_environment, {
  'FFFFFFFFFFF' => "dsfmslfmlsmdfmsklmfsmdkfm"
  #'PATH' => "/path/to/.rvm/gems/ree/1.8.7/bin:/path/to/.rvm/bin:/path/to/.rvm/ree-1.8.7-2009.10/bin:$PATH",
  #'RUBY_VERSION' => 'ruby 1.8.7',
  #'GEM_HOME'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
  #'GEM_PATH'     => '/path/to/.rvm/gems/ree-1.8.7-2010.01',
  #'BUNDLE_PATH'  => '/path/to/.rvm/gems/ree-1.8.7-2010.01'  # If you are using bundler.
}
