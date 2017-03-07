class CustomField < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_one :user
end
