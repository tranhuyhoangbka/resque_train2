class ExampleRetryJob
  extend Resque::Plugins::Retry
  @queue = :example_resque_retry

  @retry_limit = 3
  @retry_delay = 60
  @sleep_after_requeue = 5

  class << self
    def perform one, two
      puts "Output is: #{one} #{two}"
    end
  end
end
