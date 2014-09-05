require 'net/http'
require 'json'

class Slack
  def message channel, text
    {
      username: 'Marvin',
      icon_url: 'http://png-5.findicons.com/files/icons/1626/the_hitchhiker_s_guide_to_the_galaxy/128/marvin.png',
      channel:  "##{channel}",
      text:     text
    }.to_json
  end

  def post channel, text
    Net::HTTP.post_form(URL, 'payload' => message(channel, text))
  end

  def pugfy channel
    Slack.new.post channel, Pugfy.new.random_pug
  end
end

class Pugfy
  def random_pug
    source = 'http://pugme.herokuapp.com/random'
    resp   = Net::HTTP.get_response URI.parse(source)
    data   = resp.body
    result = JSON.parse data
    result['pug']
  end
end
