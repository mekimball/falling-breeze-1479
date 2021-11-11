require 'rails_helper'

RSpec.describe 'plot index page', type: :feature do
  before do
    @garden1 = Garden.create!(name: "Garden1", organic: true)
    @plot1 = @garden1.plots.create!(number: 1, size: "large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 2, size: "medium", direction: "West")
    @plot3 = @garden1.plots.create!(number: 3, size: "small", direction: "North")
    visit plots_path
  end
  describe 'plot index page' do
    it 'shows list of all plot numbers' do

      expect(page).to have_content("Plot Number: #{@plot1.number}")
      expect(page).to have_content("Plot Number: #{@plot2.number}")
      expect(page).to have_content("Plot Number: #{@plot3.number}")
    end
  end
end
# User Story 1, Plots Index Page
# As a visitor
# When I visit the plots index page ('/plots')
# I see a list of all plot numbers
# And under each plot number I see names of all that plot's plants