require 'rails_helper'

RSpec.describe Contact do
  let(:contact) { build :contact }
  describe Contact do
    it "has name" do
      expect(contact.save).to be
    end
  end
end
