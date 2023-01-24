class Games 
  attr_accessor :players, :current_score, :current_player_index

  def initialize
    @players = []
    @current_score = []
    @current_player_index = 0
  end

  def start
    puts "What is the first player name?"
    print ">"
    player_1 = gets.chomp
    puts "what is the second player name?"
    print ">"
    player_2 = gets.chomp

    playerOne = Players.new(player_1)
    playerTwo = Players.new(player_2)
    @players.push(playerOne, playerTwo)
    @current_score.push(playerOne.score, playerTwo.score)
    game_time
  end

  def switch_turns 
    if @current_player_index == 0
      @current_player_index = 1
    else
      @current_player_index = 0
    end
  end

  def game_time
    while (@current_score[0] != 0 || @current_score[1] != 0)
      question = Questions.new
      if (!question.ask_question(@players[current_player_index].player))
        @current_score[current_player_index] -= 1 
        if @current_score[current_player_index] != 0
          puts "#{@players[current_player_index].player}: Seriously?!? NO"
          puts "P1: #{@current_score[0]} vs P2: #{@current_score[1]}"
          puts "---- NEW TURN ----"
        end 
      else 
        puts "#{@players[current_player_index].player}: Yes, you are correct!"
        puts "P1: #{@current_score[0]} vs P2: #{@current_score[1]}"
        puts "---- NEW TURN ----"
      end
      if (@current_score[0] == 0 || @current_score[1] == 0)
        game_over
      end
      switch_turns
    end
  end

  def game_over
    if current_player_index == 1 
      puts "#{@players[0].player} wins with a score of #{@current_score[0]}/3"
    else 
      puts "#{@players[1].player} wins with a score of #{@current_score[1]}/3"
    end
    puts "---- GAME OVER ----"
    puts "Good bye!"
    exit(0)
  end 


end



