class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :not_the_same

  before_create :set_review_date, on: :create


  def not_the_same
    errors.add(:translated_text) if translated_text.downcase == original_text.downcase
  end

def set_new_review_date
   self.review_date = Time.now + 3.days
end

protected

  def set_review_date
   self.review_date = Time.now + 3.days
  end

end