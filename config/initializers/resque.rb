#Resque.logger = Logger.new(Rails.root.join("log", "#{Rails.env}_resque.log"))
# Resque.logger.level = :info
require 'resque-retry'
require 'resque/failure/redis'
rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env = ENV['RAILS_ENV'] || 'development'

resque_config = YAML.load_file(rails_root + '/config/resque.yml')
Resque.redis = resque_config[rails_env]
Resque.redis.namespace = "resque:train2"
Resque::Plugins::Status::Hash.expire_in = (24 * 60 * 60) # 24hrs in seconds

Resque::Failure::MultipleWithRetrySuppression.classes = [Resque::Failure::Redis]
Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression
