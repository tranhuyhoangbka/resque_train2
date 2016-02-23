class Repository::ProcessJob
  attr_reader :klass, :params

  def initialize klass, *params
    @klass = klass
    @params = params
  end

  def enqueue
    Resque.enqueue klass, *params
    #puts "#{params}"
  end
end
