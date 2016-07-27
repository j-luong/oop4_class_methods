require_relative "player"
require_relative "name"
class Team
  attr_accessor :name

  def self.name(name)
    @name = name
  end

  def self.build_default(player_class = Player)
    jammer   = player_class.new("Bambi Brainbox", jammer: true)
    pivot    = player_class.new("The Rib Jammer", pivot: true)
    blocker1 = player_class.new("Iridian Cyclone")
    blocker2 = player_class.new("Star Tsunami")
    blocker3 = player_class.new("Anastasia Dragonfly")

    new(Team.name("Fuck dis shit"), jammer, pivot, [blocker1, blocker2, blocker3])
  end

  def self.build(name, players)
    return "Team has wrong number of players" unless players.count == 5
    jammer = players.find{ |player| player.jammer? }
    pivot = players.find{ |player| player.pivot? }
    blockers = players.select{ |player| !player.jammer? && !player.pivot? }

    return "No jammer" unless jammer
    return "No pivot" unless pivot

    new(name, jammer, pivot, blockers)
  end

  attr_reader :jammer, :pivot, :blockers

  def initialize(name, jammer, pivot, blockers)
    @name = name
    @jammer = jammer
    @pivot = pivot
    @blockers = [pivot, *blockers]
  end

  def players
    [jammer, *blockers]
  end
end
