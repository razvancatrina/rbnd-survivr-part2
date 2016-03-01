class Tribe
	attr_reader :name, :members

	def initialize(values = {})
		@name = values[:name]
		@members = values[:members]

		puts "New tribe created #{@name}"
	end

	def to_s
		@name
	end

	def tribal_council(params = {})
		@members.find { |member| member.name != params[:immune].name }		
	end
end