class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :non_clickbait, acceptance: true
  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def non_clickbait
    if CLICKBAIT.none? { |bait| bait.match title }
      "This is clickbait"
    end
  end
end
