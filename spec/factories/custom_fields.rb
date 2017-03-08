FactoryGirl.define do
  factory :custom_field_textfield, class: CustomField do
    user_id 1
    custom_field_type 0
    name "text field"
    description "teste"
    default "padrao"
  end

  factory :custom_field_textfield_invalid, class: CustomField do
    user_id 1
    custom_field_type 0
    name ""
    description "teste"
    default "padrao"
  end

  factory :custom_field_textfield_false, class: CustomField do
    user_id 1
    custom_field_type 0
    description "teste"
    default "padrao"
  end

  factory :custom_field_textarea, class: CustomField do
    user_id 1
    custom_field_type 1
    name "text area"
    description "teste"
    default "padrao"
  end

  factory :custom_field_combobox, class: CustomField do
    user_id 1
    custom_field_type 2
    name "combo box"
    description "teste"
    default "12\r\n34\r\n56"
  end

  factory :custom_field_textfield_one, class: CustomField do
    user_id 1
    custom_field_type 0
    name "text field"
    description "teste"
    default "padrao"
  end

  factory :custom_field_textfield_two, class: CustomField do
    user_id 2
    custom_field_type 0
    name "text field"
    description "teste"
    default "padrao"
  end

  factory :custom_field_textfield_three, class: CustomField do
    user_id 1
    custom_field_type 0
    name "text field"
    description "teste"
    default "padrao"
  end
end
