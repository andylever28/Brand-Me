  class TwitterDatumController < ApplicationController
      before_action :set_user, only: [:index, :new, :create]

  def new

    # fire method run_twitter_api in twitter datum model
    @twitter = TwitterDatum.new
    # @twitter.run_twitter_api

  end

  def index
  	@twitter = User.find(current_user).twitter_datum

  end

  def create
    screen_name = params[:q]
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
     @user.twitter_datum.create(followers_count: response["followers_count"], screen_name: response["screen_name",], statuses_count: response["statuses_count"], id_str: response["id_str"],created_at: response["created_at"], last_status: response["last_status"])


     puts @user
     puts @user["followers_count"]
     puts "************We want the new entry's ID to be equal to currently logged in ID.  Right now, new_twitter_entry user_id is: #{@user["user_id"]}"
     puts "*************...And this doesn't mean much, but @user is: #{@user}"

  end

  def edit
  end

  def destroy
  end

  private

  def set_user
      @user = User.find(current_user.id)
  end
end
