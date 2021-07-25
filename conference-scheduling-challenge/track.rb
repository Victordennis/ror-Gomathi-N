class Track
  attr_accessor :forenoon_session, :after_noon_session, :name
  def initialize(name)
    @name = name
    @fore_noon_session = Session.new('forenoon')
    @after_noon_session = Session.new('afternoon')
  end

  def schedule(lightning_talks, long_talks)
    puts name
    puts '------------------ Forenoon Session --------------------------------------------------------------------'
    lightning_talks, long_talks, scheduled_talks = @fore_noon_session.schedule(lightning_talks, long_talks)
    print_schedule(scheduled_talks)
    puts '------------------ Afternoon Session -------------------------------------------------------------------'
    lightning_talks, long_talks, scheduled_talks = @after_noon_session.schedule(lightning_talks, long_talks)
    print_schedule(scheduled_talks)
    return lightning_talks, long_talks
  end

  def print_schedule(schduled_talks)
    schduled_talks.each do |talk|
      puts "#{talk[:start_time].strftime('%I:%M %p')} - #{talk[:topic]} - #{talk[:duration]} min"
    end
  end
end