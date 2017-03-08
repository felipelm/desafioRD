module CustomFieldsHelper
  def custom_field_type_name(cf)
    case cf.custom_field_type
      when 0
        "Text Field"
      when 1
        "Text Area"
      else 2
        "Combo Box"
      end
  end
end
