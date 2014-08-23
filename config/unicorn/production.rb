# config/unicorn/production.rb

preload_app true

working_directory "/var/www/tfe/production/current"
pid "/var/www/tfe/production/shared/tmp/pids/unicorn.pid"
stderr_path "/var/www/tfe/production/shared/log/unicorn.log"
stdout_path "/var/www/tfe/production/shared/log/unicorn.log"
listen "/var/www/tfe/production/shared/tmp/sockets/unicorn.sock"
worker_processes 2
timeout 60

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
  
  if defined?(Resque)
    Resque.redis = ENV['REDIS_URI']
    Rails.logger.info('Connected to Redis')
  end
  
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
