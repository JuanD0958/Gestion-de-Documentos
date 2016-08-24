class Ping < ActiveRecord::Base
	belongs_to :work_day

	scope :all_pins, ->(work_day_id) {where(work_day_id: work_day_id)}
	
end

	 