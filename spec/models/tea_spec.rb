require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :temperature }
    it { should validate_presence_of :brew_time }
    it { should validate_presence_of :status }
  end

  describe 'relationships' do
    xit { should have_many(:customer_subscriptions) }
    xit { should have_many(:subscriptions).through(:customer_subscriptions) }
  end
end
