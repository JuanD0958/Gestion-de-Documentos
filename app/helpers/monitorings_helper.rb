module MonitoringsHelper


	def students_json
		json = {}
		Student.all.each do |s|
			json[s.code] = {name: s.full_name, id: s.id}
		end
		json.to_json		
	end


end
