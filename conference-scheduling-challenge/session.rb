class Session
  attr_accessor :slot_duration, :start_time, :end_time, :scheduled_sessions
  FORE_NOON_SESSION_DURATION = 3 * 60
  AFTER_NOON_SESSION_DURATION = 4 * 60

  def initialize(session_type)
    @slot_duration = forenoon?(session_type) ? FORE_NOON_SESSION_DURATION : AFTER_NOON_SESSION_DURATION
    @start_time = session_start_time(session_type)
    @end_time = session_end_time(session_type)
    @scheduled_sessions = []
  end

  def schedule(lightning_talks, long_talks)
    # Allocated lightning as the first thing
    lightning_talks = schedule_lightning_talks(lightning_talks)
    long_talks = schedule_long_talks(long_talks)
    return lightning_talks, long_talks, @scheduled_sessions
  end

  def schedule_lightning_talks(lightning_talks)
    return lightning_talks if lightning_talks.length.positive? && lightning_talks[0][:scheduled]
    return lightning_talks if @slot_duration < lightning_talks.sum { |talk| talk[:duration] }

    lightning_talks.map do |talk|
      start_time = @start_time
      end_time = @start_time + talk[:duration] * 60
      @slot_duration -= talk[:duration]
      @start_time = end_time
      @scheduled_sessions << talk.merge(start_time: start_time)
      talk.merge(scheduled: true)
    end
  end

  def schedule_long_talks(long_talks)
    long_talks.map do |talk|
      start_time = @start_time
      end_time = @start_time + talk[:duration] * 60
      if talk[:scheduled] || @slot_duration.zero? || end_time > @end_time
        talk
      else
        @start_time = end_time
        @scheduled_sessions << talk.merge(start_time: start_time)
        talk.merge(scheduled: true)
      end
    end
  end

  def session_start_time(type)
    time_now = Time.now
    Time.new(time_now.year, time_now.month, time_now.day, forenoon?(type) ? 9 : 13, 0, 0, 0)
  end

  def forenoon?(type)
    type == 'forenoon'
  end

  def session_end_time(type)
    time_now = Time.now
    Time.new(time_now.year, time_now.month, time_now.day, forenoon?(type) ? 12 : 17, 0, 0, 0)
  end
end