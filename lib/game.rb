class Game
		attr_reader :tribes

		def initialize(tribe1, tribe2)
			@tribes = []
			@tribes.push(tribe1)
			@tribes.push(tribe2)
		end

		def has_tribes?
			@tribes != nil && @tribest.length >= 1
		end

		def add_tribe(tribe)
			@tribes.push(tribe)
		end

		def immunity_challenge
			@tribes.shuffle!.first
		end

		def clear_tribes
			@tribes.clear
		end

		def merge(name)
			new_tribe = Tribe.new({name: name, members: []})
			@tribes.each do |tribe|
				new_tribe.members.concat(tribe.members)
			end

			return new_tribe
		end

		def individual_immunity_challenge
			tribes.shuffle![0].members.shuffle![0]
		end
end