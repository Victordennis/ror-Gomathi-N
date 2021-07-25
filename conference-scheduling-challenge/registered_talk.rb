class RegisteredTalk
  LIGHTNING_TALK_DURATION = 5

  @@registered_talks = { lightning_talks: [], long_talks: [] }

  def initialize(topic:, duration:)
    if duration == :lightning_talk
      @@registered_talks[:lightning_talks] << { topic: topic, duration: LIGHTNING_TALK_DURATION, scheduled: false }
    else
      @@registered_talks[:long_talks] << { topic: topic, duration: duration, scheduled: false }
    end
  end

  def self.all_registered_talks
    @@registered_talks
  end
end