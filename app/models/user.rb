class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  validates :posts_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :name, presence: true
  def most_recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
  # Roles = [ :admin , :default ]

  def admin?(_requested_role)
    role == requested.role.to_s
    # :role == 'admin'
  end
end
