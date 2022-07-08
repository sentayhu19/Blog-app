class Comment < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
    belongs_to :post, counter_cache: :comments_counter
  
    private
  
    def update_comments_count
      post.update(comments_counter: post.comments.size)
    end
  end