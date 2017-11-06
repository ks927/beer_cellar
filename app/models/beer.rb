class Beer < ApplicationRecord
  belongs_to :user
    
  validates :name, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validate :rating_between_zero_and_five 
  validates :brewery, presence: true
  validates :style, presence: true
  
  before_save :format_date
    
  # Formats date time to m-d-Y
  def format_date
    date.strftime("%m-%d-%Y") && cellar_date.strftime("%m/%d/%Y")
  end
    
  def rating_between_zero_and_five
    if rating < 0 || rating > 5
       errors.add(:rating, "Keep your rating between 0 and 5!") 
    end
  end
    
end
