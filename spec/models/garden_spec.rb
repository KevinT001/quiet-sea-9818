require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  before :each do 
    @garden1 = Garden.create!(name: "Private Garden", organic: false)
    @garden2 = Garden.create!(name: "Illegal Garden", organic: true)

    @plot1 = @garden2.plots.create!(number: 12, size: "Large", direction: "South")
    @plot2 = @garden2.plots.create!(number: 13, size: "small", direction: "North")
    @plot3 = @garden2.plots.create!(number: 14, size: "Medium", direction: "West")
    @plot4 = @garden1.plots.create!(number: 15, size: "Medium", direction: "East")

    @plant1 = Plant.create!(name: "Hallucenagenic Mushroom", description: "Make the world a bit funnier", days_to_harvest: 45 )
    @plant2 = Plant.create!(name: "A Green FLower", description: "Smells like a skunk", days_to_harvest: 50 )
    @plant3 = Plant.create!(name: "Ayuhasca", description: "Find yourself beyond the vail", days_to_harvest: 220 )

    @plot_plant1 = PlotPlant.create!(plot_id: @plot4.id, plant_id: @plant3.id )
    @plot_plant2 = PlotPlant.create!(plot_id: @plot4.id, plant_id: @plant2.id )
    @plot_plant3 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant3.id) 
    @plot_plant4 = PlotPlant.create!(plot_id: @plot2.id, plant_id: @plant1.id )

  end

  describe 'model method test' do 
    it "less then 100 days to harvest plants" do 

      expect(@garden1.short_harvest).to eq["A Green Flower"]
    end
  end
end
