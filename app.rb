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
get '/pugfy' do
  Pugfy.new.pugfy '#shawarma_joint'
end
