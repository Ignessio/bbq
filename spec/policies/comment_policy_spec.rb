require 'rails_helper'

RSpec.describe CommentPolicy, type: :policy do
  let(:user) { User.create!(name: 'User', email: 'user@me.ru', password: '123456') }
  let(:event) { Event.create(title: 'Event', address: 'Address', datetime: Time.now, user: user) }
  let(:comment) { event.comments.build(body: 'Comment', user_name: 'User') }

  subject { described_class }

  describe 'user authorized' do
    permissions :create? do
      it { is_expected.to permit(user, comment) }
    end

    permissions :destroy? do
      it { is_expected.to permit(user, comment) }
    end
  end

  describe 'user not authorized' do
    permissions :create? do
      it { is_expected.not_to permit(nil, comment) }
    end

    permissions :destroy? do
      it { is_expected.not_to permit(nil, comment) }
    end
  end
end
