class Contact < ActiveRecord::Base
  has_many :custom_field_values
end
