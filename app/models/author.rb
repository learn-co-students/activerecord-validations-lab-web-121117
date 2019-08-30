class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: {is: 10}
end
#
# 1. All authors have a name
# 1. No two authors have the same name
# 1. Author phone numbers are exactly ten digits
