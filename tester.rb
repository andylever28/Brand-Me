require 'httParty'
require 'json'
require 'base64'
require 'byebug'

# https://dev.twitter.com/rest/tools/console

# twitter_key = "RsOGbdKOmvpGd0KPMDsznpZx4"
# secret_key = "IIxfJP1jGIOGwJb9gK7M4inOwmcMdXQvo15Eus5ueKFcsxH8p5"
# encoded_key = Base64.strict_encode64("#{twitter_key}:#{secret_key}".force_encoding('UTF-8'))
#
# p encoded_key




# **********    Step 2:  Get Bearer Token **********************
# https://dev.twitter.com/oauth/application-only
# headers = {
#   "host" => "api.twitter.com",
#   "User-Agent" => "AmbassadorSeeksBrand",
#   "Authorization" => "Basic UnNPR2JkS09tdnBHZDBLUE1Ec3pucFp4NDpJSXhmSlAxakdJT0d3SmI5Z0s3TTRpbk93bWNNZFhRdm8xNUV1czV1ZUtGY3N4SDhwNQ==",
#   "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8",
#   "Content-Length" => "29",
#   "Accept-Encoding" => "gzip"
# }
# body = {
#   "grant_type" => "client_credentials"
# }
#
# response = HTTParty.post(
#   "https://api.twitter.com/oauth2/token",
#   :headers => headers,
#   :body => body
# )
# p response

# RESPONSE:
# <HTTParty::Response:0x7f94698ce060 parsed_response={"token_type"=>"bearer", "access_token"=>"AAAAAAAAAAAAAAAAAAAAAFS0yAAAAAAADesZi9flZyhmvRWLvqKwlhE28UA%3DQe2hMEzpFGAAAMfoNRJ2gvpvJAvve6civBOag4OPeUC8UsQ38J"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["no-cache, no-store, must-revalidate, pre-check=0, post-check=0"], "connection"=>["close"], "content-disposition"=>["attachment; filename=json.json"], "content-length"=>["150"], "content-type"=>["application/json;charset=utf-8"], "date"=>["Wed, 30 Nov 2016 02:55:06 GMT"], "expires"=>["Tue, 31 Mar 1981 05:00:00 GMT"], "last-modified"=>["Wed, 30 Nov 2016 02:55:06 GMT"], "ml"=>["A"], "pragma"=>["no-cache"], "server"=>["tsa_c"], "set-cookie"=>["guest_id=v1%3A148047450673734340; Domain=.twitter.com; Path=/; Expires=Fri, 30-Nov-2018 02:55:06 UTC"], "status"=>["200 OK"], "strict-transport-security"=>["max-age=631138519"], "x-connection-hash"=>["860b1956c717de8143776c0a0ff68fce"], "x-content-type-options"=>["nosniff"], "x-frame-options"=>["DENY"], "x-response-time"=>["90"], "x-transaction"=>["003829430055e6ad"], "x-tsa-request-body-time"=>["0"], "x-twitter-response-tags"=>["BouncerCompliant"], "x-ua-compatible"=>["IE=edge,chrome=1"], "x-xss-protection"=>["1; mode=block"]}>

# ***************  END STEP 2 *************************


# *************** Step 3: Authenticate API requests with the bearer token ************
# https://dev.twitter.com/oauth/application-only

screen_name = "carmenb162"

headers = {
  "host" => "api.twitter.com",
  "User-Agent" => "AmbassadorSeeksBrand",
  "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAFS0yAAAAAAADesZi9flZyhmvRWLvqKwlhE28UA%3DQe2hMEzpFGAAAMfoNRJ2gvpvJAvve6civBOag4OPeUC8UsQ38J",
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
puts "likes, AKA favourites_count #{response["favourites_count"]}"
puts "wtf is this? listed_count #{response["listed_count"]}"
puts "tweets, AKA statuses_count #{response["statuses_count"]}"
puts "likes, AKA favourites_count #{response["favourites_count"]}"
puts "wtf is this? id_str #{response["id_str"]}"
puts "think this is recent status... #{response["status"]["text"]}"


# screen_name
# created_at
# followers_count
# statuses_count
# id_str
# last_status
