# The adapter you want to connect with. Make sure you've added the
# appropriate gem to the Gemfile.
# heroku uses a RACK_ENV of 'production' by default
if ENV['RACK_ENV'] == 'production'
  config.robot.adapter = :slack
  config.redis[:url] = ENV.fetch('REDIS_URL')
else
  config.robot.adapter = :shell
end
# slack adapter demands a value even in dev when we aren't using it...
 config.adapters.slack.token = ENV.fetch('SLACK_TOKEN', '')
