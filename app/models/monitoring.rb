class Monitoring < ActiveRecord::Base
	belongs_to :user
	has_many :work_days


	scope :monitoring_by_id, -> (user_id) { where(user_id: user_id  ) }
end