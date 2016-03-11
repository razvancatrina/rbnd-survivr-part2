require 'colorizr'

class Jury
	attr_accessor :members

	def initialize
		@members = []
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
			key = finalists.shuffle![0].to_s
		  votes[key] += 1
		  puts "#{member.name.green} voted #{key}" + "\n"
		end
		puts
		return votes
	end

	def report_votes(final_votes)
		final_votes.each do |k, v|
			puts "#{k} has #{v} votes" + "\n"
		end
	end

	def announce_winner(final_votes)
		winner =	final_votes.select {|k,v| v == final_votes.values.max }.keys.first
		puts "###### #{winner.to_s.green } has won the competition ###### "
		return winner
	end
end