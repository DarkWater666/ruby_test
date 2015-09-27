class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  fail WrongNumberOfPlayersError, 'Игроков должно быть двое!' if game.size != 2
  allow = %w(R P S)
  game.each do |gamer, strategy|
    fail NoSuchStrategyError, "Недопустимый ход у игрока - #{gamer}!" unless allow.include? strategy.upcase
  end
  wins = { 'R' => 'S', 'S' => 'P', 'P' => 'R' }
  gamer1 = game.first
  gamer2 = game.last
  return gamer1 if gamer1.last == gamer2.last
  wins[gamer1.last] == gamer2.last ? gamer1 : gamer2
end
