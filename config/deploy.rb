set :application, "Pioneer App"
set :repository,  "."
set :deploy_via, :copy

set :scm, :git

set :user, "passenger"
set :use_sudo, false
set :deploy_to, "rails/pioneer"

role :web, "bmaas.de"                          # Your HTTP server, Apache/etc
role :app, "bmaas.de"                          # This may be the same as your `Web` server
role :db,  "bmaas.de", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end