class ExampleJobLoner
  include Resque::Plugins::UniqueJob
  @queue = :job_loner

  class << self
    def perform user_id
      sleep 6
      puts "This user is: #{user_id}"
    end
  end
end
