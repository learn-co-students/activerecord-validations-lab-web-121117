class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validates :non_clickbait, acceptance: true

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def non_clickbait
    if CLICKBAIT.none? { |bait| bait.match title }
      errors.add(:title, "where's the clickbait")
    end
  end
end
