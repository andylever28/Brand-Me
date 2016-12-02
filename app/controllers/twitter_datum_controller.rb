class TwitterDatumController < ApplicationController
  def new
  	@twitter = TwitterDatum.new
    @twitter.run_twitter_api
  end

  def index
  	@twitter = User.find(current_user).twitter_datum
  end
  def create
  end

  def edit
  end

  def destroy
  end
end
