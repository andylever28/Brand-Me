class TwitterDatum < ApplicationRecord
  belongs_to :user

  def make_them_tweet
    # generate random string for user to tweet, and give it to them in some rendered view
    # make them click "done!" once they've tweeted, so that we can THEN run the API
  end

  def run_twitter_api
    # API call goes here--must be AFTER they've tweeted the random string we gave them in
    # make_them_tweet
  end

  def check_last_tweet
    # here check API value for last tweet against instance variable supplied to user as a
    # random string to tweet
    # If it checks out, go to write_to_twitterdatum_model.  If not, kick them in the teeth.
  end

  def write_to_twitterdatum_model
    #only run this if they tweeted the instance variable of random string we told them to
    #don't want to write to TwitterDatum table unless we know it's their own handle
  end


end
