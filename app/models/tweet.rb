class Tweet < ApplicationRecord
  def client
    @client ||= Twitter::REST::Client.new(Rails.application.config.twitter)
  end

  def generate_from_twitter(query, options = {})
    options[:since_id] = (Tweet.where(query: query).maximum(:no)||0) + 1
    Twitter::REST::Client.new(Rails.application.config.twitter).search(query, options).each do |tweet|
      unless Tweet.find_by(no: tweet.id)
        Tweet.new({
                      no: tweet.id,
                      query: query,
                      text: tweet.text,
                      retweet_count: tweet.retweet_count,
                      user_no: tweet.user.id,
                      user_name: tweet.user.name,
                      user_profile_image_url: tweet.user.profile_image_url,
                      user_screen_name: tweet.user.screen_name,
                      user_location: tweet.user.location,
                      user_description: tweet.user.description,
                      user_url: tweet.user.url,
                      user_protected: tweet.user.protected,
                      user_followers_count: tweet.user.followers_count,
                      user_friends_count: tweet.user.friends_count,
                      user_listed_count: tweet.user.listed_count,
                      user_created_at: tweet.user.created_at,
                      user_favourites_count: tweet.user.favourites_count,
                      user_statuses_count: tweet.user.statuses_count
                  }).save
      end
    end
  end
end
