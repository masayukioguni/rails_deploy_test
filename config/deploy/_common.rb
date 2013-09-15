set :deploy_to, "/home/deploy/#{application}/#{stage}"

require 'capistrano-unicorn'

set :unicorn_binary, "bundle exec unicorn_rails"
set :unicorn_config, "#{current_path}/config/unicorn/#{stage}.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

before 'deploy:setup', 'rvm:install_ruby'
after 'deploy:restart', :oguni#,'unicorn:restart'

task :oguni do
  run "logger oguni task start"
  run "cp -a  /home/deploy/#{application}/#{stage}/shared/production/database.yml #{current_path}/config/database.yml"    
end
namespace :deploy do
  task :restart, :except => { :no_release => true } do
    run "logger restart task start"
    run "export A=A"
  end



  #task :finalize_update, :except => { :no_release => true } do
  #run "logger finalize_update task start"
  #run "mv -f #{latest_release}/config.yml.prod #{latest_release}/config.yml"
  #end
end