module ToJson
	def to_json
		to_hash.to_json
	end

	def to_hash
		hash = {}
        self.instance_variables.each { |var| hash[var[1..-1]] = self.instance_variable_get var }
        hash
	end
end