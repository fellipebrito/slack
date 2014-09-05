require 'sinatra'
require 'yaml'
require './post.rb'

settings = YAML.load File.read 'config/settings.yml'
TEAM    = settings['slack']['team']
TOKEN   = settings['slack']['token']
URL     = URI("https://#{TEAM}.slack.com/services/hooks/incoming-webhook?token=#{TOKEN}")

# post '/pugfy' do
get '/pugfy' do
  Pugfy.new.pugfy '#shawarma_joint'
end
