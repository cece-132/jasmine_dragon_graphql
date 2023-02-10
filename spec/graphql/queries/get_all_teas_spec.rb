require 'rails_helper'

RSpec.describe Types::QueryType do
  
  before :each do 
    tea1 = Tea.create!(title: "Tea 1" , description: "Yummy yummy in my tummy", brew_time: 90, temperature: 130, status: 0)
    tea2 = Tea.create!(title: "Tea 2" , description: "Delish nom nom ", brew_time: 120, temperature: 110, status: 0)
    tea3 = Tea.create!(title: "Tea 3" , description: "Gobble gobble", brew_time: 180, temperature: 210, status: 1)
  end

  describe 'Display All teas' do
    it 'should find all the teas' do
      result = JasmineDragonGraphqlSchema.execute(query).as_json
      binding.pry
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("teas")
      expect(result["data"]["teas"]).to be_a Array
      expect(result["data"]["teas"].count).to eq 3

      result["data"]["teas"].each do |tea|
        expect(tea).to have_key("id")
        expect(tea).to have_key("title")
        expect(tea).to have_key("description")
        expect(tea).to have_key("temperature")
        expect(tea).to have_key("brew_time")
        expect(tea).to have_key("status")
      end
    end
  end

  def query
    <<~GQL
    {
      teas {
        id
        title
        description
        temperature
        brew_time
        status
      }
    }
    GQL
  end
end