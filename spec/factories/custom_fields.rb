FactoryGirl.define do
  factory :custom_field_textfield, class: CustomField do
    custom_field_type 0
    name "text field"
    description "teste"
    default "padrao"
  end

  factory :custom_field_textarea, class: CustomField do
    custom_field_type 1
    name "text area"
    description "teste"
    default "padrao"
  end

  factory :custom_field_combobox, class: CustomField do
    custom_field_type 2
    name "text field"
    description "teste"
    default "12\r\n34\r\n56"
  end
end
