set :deploy_to, "/home/deploy/#{application}/#{stage}"

require 'capistrano-unicorn'

set :unicorn_binary, "bundle exec unicorn_rails"
set :unicorn_config, "#{current_path}/config/unicorn/#{stage}.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

before 'deploy:setup', 'rvm:install_ruby'
after 'deploy:restart', 'unicorn:restart'