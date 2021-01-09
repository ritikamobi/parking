class VehiclesController < ApplicationController
  layout "parking"
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  def index
  	search_data = params[:search_vehicle].present? ?  params[:search_vehicle] : ''
		search_data = search_data.downcase
  	@items = Vehicle.is_active.where("lower(vehicle_number) LIKE ? ", "%#{search_data}%" ).paginate(:page => params[:page], :per_page => 10)
  end
  # GET /vehicles/new
  def new
    @items = Vehicle.new
		@spot_type = Spot.where("count > 0").all.map { |p| [ p.title, p.id ] }
  end
  # POST /vehicles
  def create
   @spot_type = Spot.where("count > 0").all.map { |p| [ p.title, p.id ] }
   @spot_id = params["vehicle"].present? ? params["vehicle"]["spot_id"] : ""
	 @items = Vehicle.new(vehicle_params)
    respond_to do |format|
      if @items.save
        format.html { redirect_to :action => "index" }
        flash[:notice] = 'Vehicle is parked successfully.'
      else
        format.html { render :new }
      end
     end
  end

	# DELETE /vehicles/1
	def destroy
		@items.update(is_active: false)
		flash[:success] = "Vehicle is unparked successfully." 
		redirect_to action: :index
	end

  private 
  # Permitting params.
  def vehicle_params
     params.require(:vehicle).permit( :vehicle_number, :spot_id, :is_active)
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle    
    @items = Vehicle.find_by_id(params[:id])    
  end

end
