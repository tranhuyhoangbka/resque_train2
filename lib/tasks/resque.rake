require "resque/tasks"
require "resque/scheduler/tasks"
require "resque/pool/tasks"

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque-scheduler'

    # you probably already have this somewhere
    # Resque.redis = 'localhost:6379'
    ENV['QUEUE']='*'
    Resque.schedule = YAML.load_file [Rails.root, "/config/schedule.yml"].join
  end

  task 'pool:setup' do
    Resque::Pool.after_prefork do |job|
      Resque.redis.client.reconnect
    end
  end

  task "pool:reload" do
    puts "reload the config file, reload logfiles, restart all workers"
    Process.kill :HUP,
      File.read(Rails.root.join("tmp", "pids", "resque-pool.pid")).to_i
  end
end
