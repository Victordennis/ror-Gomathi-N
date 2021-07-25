class SessionScheduler
  attr_accessor :lightning_talks_list, :long_talks_list

  def initialize(talks_list)
    @lightning_talks_list = talks_list[:lightning_talks]
    @long_talks_list = talks_list[:long_talks]
    @track_one = Track.new('Track 1')
    @track_two = Track.new('Track 2')
  end

  def prepare_schedule
    @lightning_talks_list, @long_talks_list = @track_one.schedule(lightning_talks_list, long_talks_list)
    @lightning_talks_list, @long_talks_list = @track_two.schedule(lightning_talks_list, long_talks_list)
    print_unallocated_talks
  end

  def print_unallocated_talks
    unallocated_talks = (@lightning_talks_list + @long_talks_list).reject { |talk| talk[:scheduled] }
    return if unallocated_talks.empty?

    puts 'Unallocated Talks'
    unallocated_talks.each do |talk|
      puts "#{talk[:topic]} #{talk[:duration]} min"
    end
  end
end