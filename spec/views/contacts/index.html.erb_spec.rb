require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      create(:contact)
    ])
    @user = create(:user)
    login_as @user
  end

  it "renders a list of contacts" do
    render
  end
end
