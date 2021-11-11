class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def edit
    plot = Plot.find(params[:id])
    plant = Plant.find(params[:plant_id])
    plot.plants.destroy(plant)
    redirect_to plots_path
  end
end