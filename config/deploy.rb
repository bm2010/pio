# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2-p290'
set :rvm_type, :user

# bundler bootstrap
require 'bundler/capistrano'

set :application, "pioneer"
role :web, "bmaas.de"
role :app, "bmaas.de"
role :db,  "bmaas.de", :primary => true
set :deploy_to, "rails/pioneer"
set :user, "passenger"
set :use_sudo, false

set :scm, :git
set :scm_username, "bm2010"
set :repository,  "git@github.com:bm2010/pio.git"
set :branch, "master"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# tasks
namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'