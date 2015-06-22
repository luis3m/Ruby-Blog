class Array
	def to_json_array
		self.map { |item| if item.respond_to? :to_hash then item.to_hash else item.to_json end }.to_json
	end
end