class TwitterDatum < ApplicationRecord
 belongs_to :user


  def run_twitter_api
      #this gets fired from twitter_datum_controller, new method

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

    # This is just taking the response & plugging it into a new entry on the TwitterDatum model
    new_twitter_entry = TwitterDatum.new(followers_count: response["followers_count"], screen_name: response["screen_name",], statuses_count: response["statuses_count"], id_str: response["id_str"],created_at: response["created_at"], last_status: response["last_status"])


    new_twitter_entry.save

    puts new_twitter_entry
    puts new_twitter_entry.followers_count
    puts "************We want the new entry's ID to be equal to currently logged in ID.  Right now, new_twitter_entry user_id is: #{new_twitter_entry.user_id}"
    puts "*************...And this doesn't mean much, but @user is: #{@user}"


  # If we can see this in the terminal, then the API call is successful, regardless of whatever other bugs are out there...
    puts "***************"
    puts "***************"
    puts "***************"
    puts "***************"
    puts "these next puts's are just to see in terminal what info the API is bringing back...."
    puts "join date, AKA created_at #{response["created_at"]}"
    puts "followers, AKA followers_count #{response["followers_count"]}"
    puts "tweets, AKA statuses_count #{response["statuses_count"]}"
    puts "wtf is this? id_str #{response["id_str"]}"
    puts "think this is recent status... #{response["status"]["text"]}"
    puts "***************"
    puts "***************"
    puts "***************"

  end

  def new


  end


end
