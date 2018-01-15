#where should this go?

class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && (record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top #{/[0-9]/}") || record.title.include?("Guess"))
      record.errors[:title] << "not clickbait"
    end
  end
end


class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction , Non-Fiction) }
  validates_with ClickbaitValidator
end
