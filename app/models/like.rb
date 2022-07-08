class Like < ApplicationRecord
  belongs_to :user, class_name: 'User',
                    foreign_key: 'author_id'
  belongs_to :post, counter_cache: :likes_counter

  private

  def update_likes_count
    post.update!(likes_counter: post.likes.count)
  end
end
