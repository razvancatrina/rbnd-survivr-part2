require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
 # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

 # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

 # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================
 @jury = Jury.new()

#This is where you will write your code for the three phases
def phase_one
	removed_contestants = 0
	8.times do
			selected_tribe = @borneo.immunity_challenge
			immunity_challenge_winner = @borneo.individual_immunity_challenge
			selected_tribe.members.delete(selected_tribe.tribal_council(immune: immunity_challenge_winner))
			removed_contestants += 1
	end

	return removed_contestants
end

def phase_two
	removed_contestants = 0
	3.times do
			immune_contestant = @borneo.immunity_challenge
			@borneo.tribes[0].members.delete(@borneo.tribes[0].tribal_council(immune:immune_contestant))
			removed_contestants += 1
	end

	return removed_contestants
end

def phase_three
	removed_contestants = 0
	7.times do
		immune_contestant = @borneo.individual_immunity_challenge
		eliminated_player = @borneo.tribes[0].tribal_council(immune:immune_contestant)
		@borneo.tribes[0].members.delete(eliminated_player)

		@jury.add_member(eliminated_player)

		removed_contestants += 1
	end

	return removed_contestants
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
