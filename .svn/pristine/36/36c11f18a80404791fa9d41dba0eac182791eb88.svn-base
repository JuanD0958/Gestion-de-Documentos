class WorkDay < ActiveRecord::Base
	belongs_to :user
	belongs_to :monitoring
	belongs_to :approval
	has_many :assistences
	has_many :pings

	mount_uploader :start_signature, SignatureUploader
	mount_uploader :end_signature, SignatureUploader
	
	scope :open, -> {where(end_date: nil)}
	scope :closed, -> {where.not(end_date: nil)}	

	scope :register_monitoring, -> (monitoring_id) { where(monitoring_id: monitoring_id  ) }
	scope :register_monitoring_month, -> (monitoring_id) { where(monitoring_id: monitoring_id )}#, "date>= start AND date <= :end",start_date: Date.today.at_beginning_of_month, end_date: Date.today.at_end_of_month)  }
	
	scope :month, -> (monitoring_id)  {  where("start_date = date.at_beginning_of_month AND end_date <= date.at_end_of_month AND monitoring_id == :monitoring_id",monitoring_id: monitoring_id)	 }
	
	scope :register_by_user, -> (user_id) { where(user_id: user_id  ) }

	scope :by_id, -> (id) { find_by(id: id  ) }


	def self.current user, monitoring, ip=nil, create=false

		opt = user.work_days.open.where(monitoring_id: monitoring.id)

		if create
			opt = opt.first_or_create
			opt.update(start_date: (Time.now.utc - 5.hours)) unless opt.start_date
		else
			opt = opt.first
		end
		opt.pings.create(ip: ip) if ip and opt
		opt
	end
end
