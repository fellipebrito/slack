require 'sinatra'
require './bootstrap.rb'

# Params not used yet
# user_name=Steve
# text=94070
post '/' do
  slack = Slack.new params

  case params[:command]
  when '/pugfy'
    Pugfy.new(slack).pugfy
  end
end

post '/bitbucket/pull_request' do
  # Read Body
  request.body.rewind
  request_payload = JSON.parse request.body.read

  # Change Channel Name
  params['channel_name'] = 'pull_requests'
  params['icon_url']     = 'https://slack.global.ssl.fastly.net/20653/img/services/bitbucket_48.png'
  params['username']     = 'bitbucket'
  slack = Slack.new params

  # Process Information
  BitBucket.new(slack, request_payload).comment
end
