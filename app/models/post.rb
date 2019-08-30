class Post < ActiveRecord::Base
  validates :title, presence: true
  # validates :title, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w{Fiction Non-Fiction} }
  # validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top", "Guess"]}
  validates :non_clickbait, acceptance: true

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def non_clickbait
    if CLICKBAIT.none? {|bait| bait.match title}
      errors.add(:title, "where's the clickbait")
    end
  end
end
