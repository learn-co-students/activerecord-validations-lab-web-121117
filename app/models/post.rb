class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait, on: :create

  def is_clickbait
    errors.add(:title, "is not clickbait") unless /(Won't Believe|Secret|Guess|Top \d)/.match?(title)
  end

end
