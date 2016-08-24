class Request < ActiveRecord::Base
	belongs_to :applied_user, class_name: "User", foreign_key: :applied_id					
  	belongs_to :petitioned_user, class_name: "User"; foreign_key: :petitioner_id		
end
