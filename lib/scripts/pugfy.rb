class Pugfy
  def initialize slack
    @slack = slack
  end

  def pugfy
    @slack.post random_pug
    'You got pugfied'
  end

  private

  def random_pug
    source = 'http://pugme.herokuapp.com/random'
    resp   = Net::HTTP.get_response URI.parse(source)
    data   = resp.body
    result = JSON.parse data
    result['pug']
  end
end
