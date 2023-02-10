require 'rails_helper'

RSpec.describe Types::QueryType do
  
  before :each do 
    sub1 = Subscription.create!(title: "Green Tea Goddess", price: 3000, status: "available", frequency: "General")
    sub2 = Subscription.create!(title: "Black", price: 10000, status: "available", frequency: "General")
    sub3 = Subscription.create!(title: "Zen Master", price: 1500, status: "available", frequency: "Unique")
    sub4 = Subscription.create!(title: "Christmas Magic", price: 1300, status: "unavailable", frequency: "Seasonal")
  end

end