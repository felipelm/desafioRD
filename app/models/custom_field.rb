class CustomField < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: [:user_id] }
  has_one :user
end
