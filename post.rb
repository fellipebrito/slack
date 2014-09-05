require 'net/http'
require 'json'

TEAM    = '##YOUR_TEAM##'
TOKEN   = '##YOUR_TOKEN##'
URL     = URI("https://#{TEAM}.slack.com/services/hooks/incoming-webhook?token=#{TOKEN}")

class Slack
  def message channel, text
    {
      username: 'Marvin',
      icon_url: 'http://png-5.findicons.com/files/icons/1626/the_hitchhiker_s_guide_to_the_galaxy/128/marvin.png',
      channel:  channel,
      text:     text
    }.to_json
  end

  def post channel, text
    Net::HTTP.post_form(URL, 'payload' => message(channel, text))
  end
end

# Slack.new.post '##CHANNEL_NAME##', 'test'

class Pugfy
  def pugfy
    Slack.new.post '##CHANNEL_NAME##', random_pug
  end

  def random_pug
    source = 'http://pugme.herokuapp.com/random'
    resp   = Net::HTTP.get_response URI.parse(source)
    data   = resp.body
    result = JSON.parse data
    result['pug']
  end
end

Pugfy.new.pugfy
