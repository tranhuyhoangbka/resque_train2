class Archive
  @queue = :foo

  class << self
    def perform user_id
      puts "user is: #{user_id}\n"
    end
  end
end
