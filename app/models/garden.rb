class Garden < ApplicationRecord
  has_many :plots

  def all_plants
    plots.joins(:plants).where("plants.days_to_harvest < ?", 100).distinct.pluck(:name)
  end
end
