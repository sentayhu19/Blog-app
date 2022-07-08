class Post < ApplicationRecord
  belongs_to :user, class_name: 'User',
                    foreign_key: 'author_id',
                    counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_count

  def most_recent_five_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.update(posts_counter: user.posts.size)
  end
end
