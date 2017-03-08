module ContactsHelper
  def get_custom_field_value(cf, contact)
    contact.custom_field_values.where(custom_field_id: cf.id).try(:first).try(:value)
  end

  def get_current_value(cf)
    if !params[:cf].nil? && !params[:cf][cf.id.to_s].nil?
      current_value = params[:cf][cf.id.to_s]
    else
      has_value = @contact.custom_field_values.find_by_custom_field_id(cf.id)
      current_value = has_value ? has_value.value : cf.default
    end
    current_value
  end

  def render_custom_field(cf)
    current_value = get_current_value(cf)

    case cf.custom_field_type
      when 0
        text_field(:cf, cf.id, value: current_value, class: "form-control")
      when 1
        text_area(:cf, cf.id, value: current_value, class: "form-control")
      else 2
        select(:cf, cf.id, options_for_select(cf.default.split(/\r\n/), current_value), class: "form-control")
      end
  end
end
