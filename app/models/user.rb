class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  validates :name, presence: true
  validates :email, presence: true
    
  has_many :beers
    
  # User following another user
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    
  # User being followed by another user
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    
  # User has other users they follow
  # changing name from followeds to following with source
  has_many :following, through: :active_relationships, source: :followed
    
  # User has other uses that follow them
  # Don't necessarily need the source here
  has_many :followers, through: :passive_relationships, source: :follower
    
  # Formats date time to m-d-Y
  def format_date
    date.strftime("%m-%d-%Y") 
  end
    
  # Follows user
  def follow(other_user)
    following << other_user 
  end

  # Unfollows user
  def unfollow(other_user)
    following.delete(other_user) 
  end
    
  # Checks if current user is following other user
  def following?(other_user)
    following.include?(other_user) 
  end
    
end
