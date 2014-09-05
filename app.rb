require 'yaml'
require 'dotenv' unless ENV['RACK_ENV'] == 'production'
require 'sinatra'
require './post.rb'

Dotenv.load unless ENV['RACK_ENV'] == 'production'

settings = YAML.load ERB.new(File.read 'config/settings.yml').result
TEAM    = settings['slack']['team']
TOKEN   = settings['slack']['token']
URL     = URI("https://#{TEAM}.slack.com/services/hooks/incoming-webhook?token=#{TOKEN}")

# post '/pugfy' do
post '/' do
  # All Params
  # token=r90MABUCUMiX0PSYPfi2xZqC
  # team_id=T0001
  # channel_id=C2147483705
  # channel_name=test
  # user_id=U2147483697
  # user_name=Steve
  # command=/weather
  # text=94070

  Slack.new.pugfy params[:channel_name]
end
