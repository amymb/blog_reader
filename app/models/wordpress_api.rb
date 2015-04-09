class WordpressAPI

  def initialize
    @conn = Faraday.new(:url => 'https://public-api.wordpress.com')
  end

  # def post_info(blog)
  #   response = @conn.get do |req|
  #     req.url "/rest/v1.1/sites/#{blog}/posts"
  #     req.headers['Content-Type'] = 'application/json'
  #   end
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def post_info_for_author(blog, user_id)
    response = @conn.get do |req|
      req.url "/rest/v1.1/sites/#{blog}/posts/?author=#{user_id}&number=50"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body, symbolize_names: true)[:posts]
  end

  def username_to_id(blog, username)
    response = @conn.get do |req|
      req.url "/rest/v1.1/sites/#{blog}/posts"
      req.headers['Content-Type'] = 'application/json'
    end
    results = []
    if JSON.parse(response.body, symbolize_names: true)[:posts]
      JSON.parse(response.body, symbolize_names: true)[:posts].each do |post|
        if post[:author][:login] == username
          results << post[:author][:ID]
        end
      end
    end
    user_id = results.first
    return user_id
  end


end
