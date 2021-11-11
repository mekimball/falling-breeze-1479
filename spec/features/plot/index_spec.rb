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
    @plotplant2 = PlotPlant.create!(plot: @plot3, plant: @plant3)

    visit plots_path
  end
  describe 'plot index page' do
    it 'shows list of all plot numbers' do

      expect(page).to have_content("Plot Number: #{@plot1.number}")
      expect(page).to have_content("Plot Number: #{@plot2.number}")
      expect(page).to have_content("Plot Number: #{@plot3.number}")
    end

    it 'lists plants for each plot' do
      
      expect(page).to have_content("Plant1 Remove plant")
      expect(page).to have_content("Plant3 Remove plant")
    end
  end
  describe 'remove plants from plot' do
    it 'has a link to remove plant' do

      expect(page).to have_content(@plant2.name)

      within("#id-#{@plot1.id}-#{@plant2.id}") do
        click_link 'Remove plant'
      end
      #this is not the best test, but I don't know enough css to test it better
      expect(page).to_not have_content(@plant2.name) 
    end
  end
end