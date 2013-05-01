require 'bundler/capistrano'
require "rvm/capistrano"


set :applicationdir, "/home/christopher/web/cse412.cgthornt.com"
set :application, "CSE412"
set :repository,  "git://github.com/cgthornt/DB-Management-Honors-Contract.git"

set :deploy_to, applicationdir
set :deploy_via, :copy
set :copy_strategy, :export

set :scm, :git

role :web, "cse412.cgthornt.com"                          # Your HTTP server, Apache/etc
role :app, "cse412.cgthornt.com"                          # This may be the same as your `Web` server
role :db,  "cse412.cgthornt.com", :primary => true # This is where Rails migrations will run

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system


# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

default_run_options[:pty] = true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end