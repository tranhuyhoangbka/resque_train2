Resque::Scheduler.configure do |c|
  c.quiet = false
  c.verbose = false
  c.logfile = "#{Rails.root}/log/resque_scheduler.log"
  c.logformat = 'text'
end
