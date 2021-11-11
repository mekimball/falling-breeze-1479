require 'rails_helper'

RSpec.describe 'plot index page', type: :feature do
  before do
    @garden1 = Garden.create!(name: "Garden1", organic: true)

    @plot1 = @garden1.plots.create!(number: 1, size: "large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 2, size: "medium", direction: "West")
    @plot3 = @garden1.plots.create!(number: 3, size: "small", direction: "North")

    @plant1 = @plot1.plants.create!(name: "Plant1", description: "Is a plant", days_to_harvest: 90)
    @plant2 = @plot1.plants.create!(name: "Plant2", description: "Is another plant", days_to_harvest: 100)
    @plant3 = @plot1.plants.create!(name: "Plant3", description: "Is yet another plant", days_to_harvest: 110)

    @plotplant1 = PlotPlant.create!(plot: @plot2, plant: @plant1)
    @plotplant2 = PlotPlant.create!(plot: @plot2, plant: @plant2)
    @plotplant3 = PlotPlant.create!(plot: @plot3, plant: @plant3)

    visit plots_path
  end
  describe 'plot index page' do
    it 'shows list of all plot numbers' do

      expect(page).to have_content("Plot Number: #{@plot1.number}")
      expect(page).to have_content("Plot Number: #{@plot2.number}")
      expect(page).to have_content("Plot Number: #{@plot3.number}")
    end

    it 'lists plants for each plot' do
      
      expect(page).to have_content("Plot 1 Plants: Plant1 Plant2 Plant3")
      expect(page).to have_content("Plot 2 Plants: Plant1 Plant2")
      expect(page).to have_content("Plot 3 Plants: Plant3")
    end
  end
end
# User Story 1, Plots Index Page
# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants