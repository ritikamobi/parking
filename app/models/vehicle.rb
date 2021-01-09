class Vehicle < ApplicationRecord
  validates :vehicle_number, :presence => true,
   :format => {

   :with => /^[a-z]{2}[0-9]{2}[a-z]{1,2}[0-9]{4}/i,
   :message => 'Incorrect registration number.',
   :multiline => true 
	}

	validates :spot_id, :presence => true

  scope :is_active, -> { where(is_active: true) }
  belongs_to :spot
  default_scope { order(id: :desc) }
	before_create :check_spot
  before_update :update_parking


  #Callback to decrement the spot count before create
  def check_spot
  	spot = self.spot_id
  	spot_count = Spot.find_by_id(spot).count
  	new_spot_count = spot_count - 1
  	Spot.where(id: spot).update(count: new_spot_count) if new_spot_count >= 0
  end

  #Callback to increment the spot count after update
  def update_parking
  	spot = self.spot_id
  	spot_count = Spot.find_by_id(spot).count
  	new_spot_count = spot_count + 1
		Spot.where(id: spot).update(count: new_spot_count) if new_spot_count <= 10
  end
end
