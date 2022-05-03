require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.create!(name: 'user', email: 'user@me.ru', password: '123456') }

  subject { described_class }

  describe 'user authorized' do
    permissions :create? do
      it { is_expected.to permit(user, Event) }
    end
  end

  describe 'user not authorized' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Event) }
    end
  end
end
