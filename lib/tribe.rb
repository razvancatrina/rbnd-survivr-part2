require 'colorizr'

class Tribe
	attr_reader :name, :members

	def initialize(values = {})
		@name = values[:name]
		@members = values[:members]

		puts "\nTribe " + name.red + " was created\n"
	end

	def to_s
		@name
	end

	def tribal_council(params = {})
		puts 
		eliminated_contestant = @members.select { |member| member.name != params[:immune].name }.shuffle.sample		
		puts " #{eliminated_contestant.to_s.red} was eliminated" 
		return eliminated_contestant
	end
end