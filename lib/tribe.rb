require 'colorizr'

class Tribe
	attr_reader :name, :members

	def initialize(values = {})
		@name = values[:name]
		@members = values[:members]

		puts "Tribe " + name.red + " was created"
	end

	def to_s
		@name
	end

	def tribal_council(params = {})
		@members.select { |member| member.name != params[:immune].name }.shuffle.sample		
	end
end