require 'rails_helper'

RSpec.describe SubscriptionPolicy, type: :policy do
  let(:user) { User.create!(name: 'User', email: 'user@me.ru', password: '123456') }
  let(:guest) { User.create!(name: 'Guest', email: 'guest@me.ru', password: '123456') }
  let(:event) { Event.create(title: 'Event', address: 'Address', datetime: Time.now, user: user) }
  let(:subscription) { Subscription.create(event: event, user: user) }

  subject { described_class }

  describe 'user authorized' do
    permissions :create? do
      it { is_expected.to permit(user, Subscription) }
    end

    permissions :destroy? do
      it { is_expected.to permit(user, subscription) }
    end
  end

  describe 'user not authorized' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Subscription) }
    end

    permissions :destroy? do
      it { is_expected.not_to permit(nil, subscription) }
    end

    permissions :destroy? do
      it { is_expected.not_to permit(guest, subscription) }
    end
  end
end
