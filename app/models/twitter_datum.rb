class TwitterDatum < ApplicationRecord
 belongs_to :user

  def run_twitter_api

    screen_name = "potus"

    headers = {
      "host" => "api.twitter.com",
      "User-Agent" => "AmbassadorSeeksBrand",
      "Authorization" => ENV["twitter_bearer_token"],
      "Accept-Encoding" => "gzip"
    }

    query = {
      "screen_name" => screen_name
    }

    response = HTTParty.get(
      "https://api.twitter.com/1.1/users/show.json",
      :headers => headers,
      :query => query
    )

    puts "screen_name #{response["screen_name"]}"
    puts "join date, AKA created_at #{response["created_at"]}"
    puts "following, AKA friends_count #{response["friends_count"]}"
    puts "followers, AKA followers_count #{response["followers_count"]}"


  end

  def new
    # this if they tweeted the instance variable of random string we told them to
    #don't want to write to TwitterDatum table unless we know it's their own handle
  end


end
