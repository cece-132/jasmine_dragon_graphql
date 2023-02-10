require 'rails_helper'

RSpec.describe Types::QueryType do
  
  before :each do 
    sub1 = Subscription.create!(title: "Green Tea Goddess", price: 3000, status: "available", frequency: "General")
    sub2 = Subscription.create!(title: "Black", price: 10000, status: "available", frequency: "General")
    sub3 = Subscription.create!(title: "Zen Master", price: 1500, status: "available", frequency: "Unique")
    sub4 = Subscription.create!(title: "Christmas Magic", price: 1300, status: "unavailable", frequency: "Seasonal")
  
    
    describe "Display all subscriptions" do 
      it 'should find all the subscriptions' do
        result = JasmineDragonGraphqlSchema.execute(query).as_json
        expect(result["data"]).to be_a Hash
        expect(result["data"]).to have_key("subscriptions")
        expect(result["data"]["subscriptions"]).to be_a Array
        expect(result["data"]["subscriptions"].count).to eq 3
  
        result["data"]["subscriptions"].each do |subscription|
          expect(subscription).to have_key("id")
          expect(subscription).to have_key("title")
          expect(subscription).to have_key("price")
          expect(subscription).to have_key("frequency")
        end
      end
    end

  def query
    <<~GQL
    {
      subscriptions {
        id
        title
        price
        status
        frequency
      }
    }
    GQL
  end

end