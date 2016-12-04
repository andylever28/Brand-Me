class TwitterDatum < ApplicationRecord
 belongs_to :user


  def run_twitter_api

    # here is where we plug in the session variable containing the user's purported Twitter handle
    # may be good to clean it up--if it begins with @, remove the @, etc.
    # plug it into where I've got "potus"
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

    new_twitter_entry = TwitterDatum.new(followers_count: response["followers_count"], screen_name: response["screen_name",], statuses_count: response["statuses_count"], id_str: response["id_str"],created_at: response["created_at"], last_status: response["last_status"])

    new_twitter_entry.save

    puts new_twitter_entry
    puts new_twitter_entry.followers_count
    puts "new_twitter_entry user_id is: #{new_twitter_entry.user_id}"
    puts "@user is: #{@user}"
    # puts "session[:user_id] is: #{session[:user_id]}"
    puts params


    #
    #
    # "screen_name" = response["screen_name"]
    #
    puts "join date, AKA created_at #{response["created_at"]}"
    puts "followers, AKA followers_count #{response["followers_count"]}"
    puts "tweets, AKA statuses_count #{response["statuses_count"]}"
    puts "wtf is this? id_str #{response["id_str"]}"
    puts "think this is recent status... #{response["status"]["text"]}"

  end

  def new




    # this if they tweeted the instance variable of random string we told them to
    #don't want to write to TwitterDatum table unless we know it's their own handle
  end


end
