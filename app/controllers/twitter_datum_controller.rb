  class TwitterDatumController < ApplicationController
    # before_action :rando, only: [:new]
  def new

    # fire method run_twitter_api in twitter datum model
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
