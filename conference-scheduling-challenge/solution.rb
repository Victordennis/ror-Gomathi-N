require_relative 'registered_talk'
require_relative 'session_scheduler'
require_relative 'track'
require_relative 'session'

# Seed available talks
RegisteredTalk.new(topic: 'Pryin open the black box', duration: 60)
RegisteredTalk.new(topic: 'Migrating a huge production codebase from sinatra to Rails', duration: 45)
RegisteredTalk.new(topic: 'How does bundler work', duration: 30)
RegisteredTalk.new(topic: 'Sustainable Open Source', duration: 45)
RegisteredTalk.new(topic: 'How to program with Accessiblity in Mind', duration: 45)
RegisteredTalk.new(topic: 'Riding Rails for 10 years', duration: :lightning_talk)
RegisteredTalk.new(topic: 'Implementing a strong code review culture', duration: 60)
RegisteredTalk.new(topic: 'Scaling Rails for Black Friday', duration: 45)
RegisteredTalk.new(topic: "Docker isn't just for deployment", duration: 30)
RegisteredTalk.new(topic: 'Callbacks in Rails',duration: 30)
RegisteredTalk.new(topic: 'Microservices, a bittersweet symphony', duration: 45)
RegisteredTalk.new(topic: 'Teaching github for poets', duration: 60)
RegisteredTalk.new(topic: 'Test Driving your Rails Infrastucture with Chef', duration: 60)
RegisteredTalk.new(topic: 'SVG charts and graphics with Ruby', duration: 45)
RegisteredTalk.new(topic: 'Interviewing like a unicorn: How Great Teams Hire', duration: 30)
RegisteredTalk.new(topic: 'How to talk to humans: a different approach to soft skills', duration: 30)
RegisteredTalk.new(topic: 'Getting a handle on Legacy Code', duration: 60)
RegisteredTalk.new(topic: 'Heroku: A year in review', duration: 30)
RegisteredTalk.new(topic: 'Ansible : An alternative to chef', duration: :lightning_talk)
RegisteredTalk.new(topic: 'Ruby on Rails on Minitest', duration: 30)

# Schedule the registered talks
scheduler = SessionScheduler.new(RegisteredTalk.all_registered_talks)
scheduler.prepare_schedule
