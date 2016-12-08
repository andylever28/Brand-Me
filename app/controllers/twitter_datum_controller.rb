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
    
    if response["screen_name"] == nil
      redirect_to @user, notice: 'There was an error linking your account please try again'
    else
      @user.twitter_datum.create(followers_count: response["followers_count"], screen_name: response["screen_name"], statuses_count: response["statuses_count"], id_str: response["id_str"],created_at: response["created_at"], last_status: response["last_status"], url: response["profile_image_url"])
      redirect_to @user, notice: 'Twitter was succesfully linked to your account'
    end
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
