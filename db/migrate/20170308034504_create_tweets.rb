class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :query
      t.integer :no, null: false, limit: 8, unique: true
      t.integer :retweet_count
      t.string :text
      t.integer :user_no, null: false, limit: 8
      t.string :user_name
      t.string :user_profile_image_url
      t.string :user_screen_name
      t.string :user_location
      t.string :user_description
      t.string :user_url
      t.integer :user_followers_count
      t.integer :user_friends_count
      t.integer :user_listed_count
      t.boolean :user_protected
      t.integer :user_followers_count
      t.integer :user_friends_count
      t.integer :user_listed_count
      t.datetime :user_created_at
      t.integer :user_favourites_count
      t.integer :user_statuses_count

      t.timestamps
    end
  end
end
