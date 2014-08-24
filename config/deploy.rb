# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'tfe'
set :repo_url, 'http://github.com/westonplatter/tfe.git'

# Default branch is :master, but we ask you before deploying
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :deploy_to, "/var/www/#{fetch(:application)}/#{fetch(:stage)}"
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true

### user 
# ubuntu has passwordless root access
set :user, 'ubuntu'
set :use_sudo, true

set :linked_files, %w{
  config/application.yml
  config/database.yml
  config/secrets.yml
}

set :linked_dirs, %w{
  bin 
  log 
  tmp/pids
  tmp/cache 
  tmp/sockets 
  vendor/bundle 
}

set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# Default value for keep_releases is 5
set :keep_releases, 5


# =========== capistrano for Eventblimp

  set :resque_environment_task,   -> { true }
  set :rails_env,                 -> { fetch(:stage) }
  set :resque_kill_signal,        -> { "USR2" }
  set :scheduler_kill_signal,     -> { "KILL" }
  set :resque_log_file,           -> { "#{shared_path}/log" }
  
  namespace :devops do 
    
    desc 'files to shared' 
    namespace :upload do
      
      desc 'application.yml and database.yml'
      task :configs do 
        on roles(:web, :app), in: :sequence, wait: 4 do
          upload! 'config/database.yml', "#{deploy_to}/shared/config/database.yml"
          upload! 'config/application.yml', "#{deploy_to}/shared/config/application.yml"
          upload! 'config/secrets.yml', "#{deploy_to}/shared/config/secrets.yml"
        end    
      end
      
      desc 'all files' 
      task :all do 
        invoke 'devops:upload:configs'
      end
    end
  end

  after 'deploy:publishing', 'deploy:restart'
  namespace :deploy do
    task :restart do 
      invoke 'unicorn:legacy_restart'
      invoke 'resque:restart'
    end
  end
