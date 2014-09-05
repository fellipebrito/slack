require 'sinatra'
require './bootstrap.rb'

# Params not used yet
# user_name=Steve
# text=94070
post '/' do
  slack = Slack.new params

  case params[:command]
  when '/pugfy'
    pugfy = Pugfy.new(slack).pugfy
  end
end
