require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @current_player = @players[0]
    @game_over = false
  end

  def start
    puts "Welcome to the 2-Player Math Game!"

    until @game_over
      question = Question.new
      puts "----- NEW TURN -----"
      puts "#{@current_player.name}: #{question.question}"
      answer = gets.chomp.to_i

      if answer == question.answer
        puts "#{@current_player.name}: YES! You are correct."
      else
        @current_player.lose_life
        puts "#{@current_player.name}: Seriously? No!"
      end

      if @current_player.lives == 0
        @game_over = true
        winner = @players.select { |player| player != @current_player }[0]
        puts "----- GAME OVER -----"
        puts "#{winner.name} wins with a score of #{winner.lives}/3"
      else
        puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
        switch_players
      end
    end
  end

  private

  def switch_players
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end

game = Game.new
game.start
