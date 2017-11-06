class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  validates :name, presence: true
  validates :email, presence: true
    
  has_many :beers
    
  # Formats date time to m-d-Y
  def format_date
    date.strftime("%m-%d-%Y") 
  end
    
end
