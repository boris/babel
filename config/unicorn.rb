root = '/app'
working_directory root + '/current'

ENV['SKIP_RAILS'] = '1'

rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes (rails_env == 'production' ? 4 : 2)
# worker_processes (rails_env == 'production' ? 15 : 2)
preload_app true
timeout 30

# Listen on a Unix data socket
listen root + '/shared/sockets/unicorn.sock', :backlog => 64
#listen 8080, :tcp_nopush => true, :backlog => 1024

pid root + "/shared/tmp/pids/unicorn.pid"
stderr_path "/var/log/unicorn_err.log"
stdout_path "/var/log/unicorn_out.log"
##
# REE

# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|

  if defined?(Octopus)
    ActiveRecord::Base.connection_proxy.instance_variable_get(:@shards).each do |shard, connection_pool|
      connection_pool.disconnect!
    end
  elsif defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

#  defined?(ActiveRecord::Base) and
#    ActiveRecord::Base.connection.disconnect!

  old_pid = '/tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection

end

