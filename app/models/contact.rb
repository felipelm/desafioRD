class Contact < ActiveRecord::Base
  has_many :custom_field_values, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
