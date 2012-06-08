class Tweet
  attr_accessor :handle
  attr_accessor :body
  attr_accessor :time
  attr_accessor :id

  def self.get_5_by_handle(value)
    formatted_tweets = []
    puts Twitter.inspect
  	tweets = Twitter.timeline(value, :count => 5)

    tweets.each do |t|
      tweet = Tweet.new
      tweet.handle = value
      tweet.body = t.text
      tweet.time = t.created_at
      tweet.id = t.id

      formatted_tweets.push(tweet)
    end
  	
  	formatted_tweets
  end
end	