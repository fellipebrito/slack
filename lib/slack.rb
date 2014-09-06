require 'net/http'
require 'json'

class Slack
  def initialize params
    @params   = params
    @username = 'Marvin' || params['username']
    @icon_url = 'http://png-5.findicons.com/files/icons/1626/the_hitchhiker_s_guide_to_the_galaxy/128/marvin.png' || params['icon_url']
    @channel  = "##{@params[:channel_name]}"
  end

  def post text
    Net::HTTP.post_form(url, 'payload' => message(text))
  end

  private

  def url
    URI "https://#{TEAM}.slack.com/services/hooks/incoming-webhook?token=#{TOKEN}"
  end

  def message text
    {
      username:    @username,
      icon_url:    @icon_url,
      channel:     @channel,
      text:        text
    }.to_json
  end

  def attachments
    {
      fallback: 'New open task [Urgent]: <http://url_to_task|Test out Slack message attachments>',
      pretext:  'New open task [Urgent]: <http://url_to_task|Test out Slack message attachments>',
      color:    '#D00000',
      fields: {
        title: 'Notes',
        value: 'This is much easier than I thought it would be.',
        short: false
      }
    }.to_json
  end
end
