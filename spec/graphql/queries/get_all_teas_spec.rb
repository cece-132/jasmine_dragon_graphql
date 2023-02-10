require 'rails_helper'

RSpec.describe Types::QueryType do
  
  before :each do 
    tea1 = Tea.create!(title: "Tea 1" , description: "Yummy yummy in my tummy", brew_time: 90, temperature: 130, status: 1)
    tea2 = Tea.create!(title: "Tea 2" , description: "Delish nom nom ", brew_time: 120, temperature: 110, status: 1)
    tea3 = Tea.create!(title: "Tea 3" , description: "Gobble gobble", brew_time: 180, temperature: 210, status: 2)
  end

  describe 'Display All teas' do
    it 'should find all the teas' do
      result = IotnboBeSchema.execute(query).as_json
      expect(result["data"]).to be_a Hash
      expect(result["data"]).to have_key("practices")
      expect(result["data"]["practices"]).to be_a Array
      expect(result["data"]["practices"].count).to eq 3

      result["data"]["practices"].each do |practice|
        expect(practice).to have_key("id")
        expect(practice).to have_key("name")
        expect(practice).to have_key("websiteUrl")
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
        
      }
    }
    GQL
  end
end