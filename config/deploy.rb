set :application, "/home/christopher/web/cse412.cgthornt.com"
set :repository,  "https://github.com/cgthornt/DB-Management-Honors-Contract.git"

set :scm, :git

role :web, "cse412.cgthornt.com"                          # Your HTTP server, Apache/etc
role :app, "cse412.cgthornt.com"                          # This may be the same as your `Web` server
role :db,  "cse412.cgthornt.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end