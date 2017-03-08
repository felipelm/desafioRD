class Contact < ActiveRecord::Base
  has_many :custom_field_values, dependent: :destroy
  validates :email, presence: true, uniqueness: { scope: [:user_id] }
  has_one :user
end
