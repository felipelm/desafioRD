require 'rails_helper'

RSpec.describe "custom_fields/edit", type: :view do
  before(:each) do
    @custom_field = create(:custom_field_textfield)
    @user = create(:user)
    login_as @user
  end

  it "renders the edit custom_field form" do
    render

    assert_select "form[action=?][method=?]", custom_field_path(@custom_field), "post" do
    end
  end
end
