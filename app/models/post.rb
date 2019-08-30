

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: {in:["Fiction", "Non-Fiction"] }
  validates :validator, acceptance: :true

  def validator

    unless self.title && (self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.match(/Top[0-9]/) || self.title.include?("Guess"))
      self.errors[:title] << "Not Clickbait!"
    end
  end


end
