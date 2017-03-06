module ContactsHelper
  def render_custom_field(cf)
    case cf.custom_field_type
      when 0
        text_field(:cf, cf.name, value: cf.default)
      when 1
        text_area(:cf, cf.name, value: cf.default)
      else 2
        select_tag cf.name, options_for_select(cf.default.split(/\r\n/), "")
      end
  end
end
