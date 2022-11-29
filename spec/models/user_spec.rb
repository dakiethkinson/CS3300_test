require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user for login use' do
      user = create(:user)
      expect(user.email).to eq 'some.case@email.com'
  end    
end
