require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = @players[0]
    @game_over = false
  end

end

