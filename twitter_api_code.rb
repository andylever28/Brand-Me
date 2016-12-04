require 'httParty'
require 'json'
require 'base64'
require 'byebug'
require 'dotenv'
Dotenv.load

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

response = HTTParty.post(
  "https://api.twitter.com/1.1/users/show.json",
  :headers => headers,
  :query => query
)

puts "screen_name #{response["screen_name"]}"
puts "join date, AKA created_at #{response["created_at"]}"
puts "following, AKA friends_count #{response["friends_count"]}"
puts "followers, AKA followers_count #{response["followers_count"]}"
puts "likes, AKA favourites_count #{response["favourites_count"]}"
puts "wtf is this? listed_count #{response["listed_count"]}"
puts "tweets, AKA statuses_count #{response["statuses_count"]}"
puts "likes, AKA favourites_count #{response["favourites_count"]}"
puts "wtf is this? id_str #{response["id_str"]}"
puts "think this is recent status... #{response["status"]["text"]}"
