FactoryGirl.define do
  factory :custom_field, class: CustomField do
    custom_field_type 0
    name "texto"
    description "teste"
    default "padrao"
  end
end
