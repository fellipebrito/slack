# Documentation: https://confluence.atlassian.com/display/BITBUCKET/Pull+Request+POST+hook+management

class BitBucket
  def initialize slack, params
    @slack  = slack
    @params = params
  end

  def comment
    username = @params['pullrequest_comment_created']['user']['username']
    @slack.post "<https://bitbucket.org/#{username}|#{username}>
     added a new comment on <#{@params['pullrequest_comment_created']['links']['html']['href']}|this pull request>:\n
    #{@params['pullrequest_comment_created']['content']['raw']}"
  end
end
