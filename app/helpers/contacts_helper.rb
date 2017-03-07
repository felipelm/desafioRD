module ContactsHelper
  def render_custom_field(cf)
    has_value = @contact.custom_field_values.find_by_custom_field_id(cf.id)
    current_value = has_value ? has_value.value : cf.default

    case cf.custom_field_type
      when 0
        text_field(:cf, cf.id, value: current_value)
      when 1
        text_area(:cf, cf.id, value: current_value)
      else 2
        select(:cf, cf.id, options_for_select(cf.default.split(/\r\n/), current_value))
      end
  end
end
