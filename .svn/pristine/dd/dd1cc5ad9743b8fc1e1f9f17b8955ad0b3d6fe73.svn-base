class Assistence < ActiveRecord::Base
	belongs_to :work_day
	belongs_to :student

	mount_uploader :signature, SignatureUploader

	scope :assistances, -> (workday_id) { where(work_day_id: workday_id ) }

end
