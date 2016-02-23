class Archive
  @queue = :foo

  class << self
    def perform
      puts "Now is: #{Time.now}\n"
    end
  end
end
