require 'pry'
class BaitValidator < ActiveModel::Validator
  def validate(record)
    words = ["Won't Believe", "Secret", "Top", "Guess"]
    if !record.title || !words.any?{|word| record.title.include?(word)}
      record.errors[:title] << 'Title must be bait-y.'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validates_with BaitValidator
end
