require './lib/team'
jason = Player.new("jason", jammer: true)
nick = Player.new("nick", pivot: true)
bob = Player.new("bob")
bobbie = Player.new("bobbie")
ahmed = Player.new("ahmed")
team = [jason, nick, bob, bobbie, ahmed]
Team.build("South-East Slayers", team)
