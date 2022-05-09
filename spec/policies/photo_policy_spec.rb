require 'rails_helper'

RSpec.describe PhotoPolicy, type: :policy do
  let(:user) { User.create!(name: 'User', email: 'user@me.ru', password: '123456') }

  subject { described_class }

  describe 'user authorized' do
    permissions :create? do
      it { is_expected.to permit(user, Photo) }
    end
  end

  describe 'user not authorized' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Photo) }
    end
  end
end
