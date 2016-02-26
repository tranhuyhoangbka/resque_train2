class SleepJob
  @queue = :sleepjob

  def self.perform
    # total = (options['length'] || 1000).to_i
    # total.times do |i|
    #   num = i + 1
    #   at(num, total, "At #{num} of #{total}")
    #   sleep 1
    puts "#{Time.now}\n"
    # end
  end
end
