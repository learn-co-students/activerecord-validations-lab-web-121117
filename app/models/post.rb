class Post < ActiveRecord::Base
  validates :title, presence: true, format: { with: /(won\'t believe)|(secret)|(top \d+)|(guess)/i, on: :create }
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, presence: true, inclusion: %w(Fiction Non-Fiction)

end
