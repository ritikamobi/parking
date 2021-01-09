class SpotsController < ApplicationController
	layout "parking"

  def index
  	@items = Spot.all
  end
end
