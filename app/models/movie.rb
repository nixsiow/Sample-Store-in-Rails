# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  release_year :integer
#  price        :float(24)
#  description  :text(65535)
#  imdb_id      :string(255)
#  poster_url   :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ActiveRecord::Base
  def poster
    "http://ia.media-imdb.com/images/M/#{poster_url}.jpg"
  end

  def imdb
    "http://www.imdb.com/title/#{imdb_id}/"
  end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
