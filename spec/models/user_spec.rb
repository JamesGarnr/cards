require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Model tests' do
    let(:user) { create(:user) }
    context 'validations' do
      it { should validate_presence_of(:role) }
      it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

      it 'should validate email when domain is prohibited' do
        user.email = 'user@gmail.com'
        expect(user.save).to eq(false)
      end

      it 'should validate email when domain is allowed' do
        user.email = 'user@example.com'
        expect(user.save).to eq(true)
      end
    end

    context 'associations' do
      it { should have_many(:tasks) }
    end

    context 'enums' do
      it { should define_enum_for(:role).with_values([:admin, :team_mate]) }
    end

    context 'scopes' do
      it 'should return users in descending order' do
        expect(User.id_ordered_desc(user)).not_to include(user)
      end
    end

    context 'callbacks' do
      it 'should update firstname if first_name is blank' do
        user.first_name = ''
        user.save
        expect(user.first_name).to eq(user.email.slice(0..1).upcase)
      end
    end
  end
end
