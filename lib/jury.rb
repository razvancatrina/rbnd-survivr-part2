class Jury
	attr_accessor :members#, :votes

	def initialize
		@members = []
		#@votes = {}
	end

	def add_member(member)
		@members << member
	end

	def cast_votes(finalists)
		votes = Hash.new
			
		finalists.each do |finalist|
			votes[finalist.to_s] = 0
		end

		@members.each do |member|
			key = finalists[0].to_s
		  votes[finalists[0].to_s] += 1
		  puts "#{member.name}" + "\n"
		end
		return votes
	end

	def report_votes(final_votes)
		final_votes.each do |k, v|
			puts "#{k} has #{v} votes" + "\n"
		end
	end

	def announce_winner(final_votes)
		final_votes.select {|k,v| v == final_votes.values.max }.keys.first
	end
end