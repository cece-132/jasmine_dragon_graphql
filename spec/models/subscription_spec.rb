require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe 'relationships' do
    xit { should have_many(:customer_subscriptions) }
    xit { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
