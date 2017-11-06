class Beer < ApplicationRecord
  belongs_to :user
    
  validates :name, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :brewery, presence: true
  validates :style, presence: true
    
  # Formats date time to m-d-Y
  def format_date
    date.strftime("%m-%d-%Y") 
  end
    
    
end
