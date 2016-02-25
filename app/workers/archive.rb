class Archive
  before_enqueue :send_message
  @queue = :foo

  class << self
    def perform
      puts "Now is: #{Time.now}\n"
    end
  end

  private
  def send_message
    puts "Hooks in resque"
  end
end
