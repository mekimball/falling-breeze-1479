require 'rails_helper'

RSpec.describe Garden do
    before do
    @garden1 = Garden.create!(name: "Garden1", organic: true)
    @garden2 = Garden.create!(name: "Garden2", organic: true)

    @plot1 = @garden1.plots.create!(number: 1, size: "large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 2, size: "medium", direction: "West")
    @plot3 = @garden1.plots.create!(number: 3, size: "small", direction: "North")
    @plot4 = @garden2.plots.create!(number: 3, size: "small", direction: "North")

    @plant1 = @plot1.plants.create!(name: "Plant1", description: "Is a plant", days_to_harvest: 90)
    @plant2 = @plot1.plants.create!(name: "Plant2", description: "Is another plant", days_to_harvest: 99)
    @plant3 = @plot1.plants.create!(name: "Plant3", description: "Is yet another plant", days_to_harvest: 110)
    @plant4 = @plot4.plants.create!(name: "Plant4", description: "Is yet another another plant", days_to_harvest: 5)

    @plotplant1 = PlotPlant.create!(plot: @plot2, plant: @plant1)
    @plotplant2 = PlotPlant.create!(plot: @plot3, plant: @plant3)
  end
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'methods' do
    it '#all_plants' do
      expect(@garden1.all_plants).to eq([@plant1.name, @plant2.name])
    end
  end

end
