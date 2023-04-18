#######################################################
#
# Harrison Corbin
#
#######################################################
class Connect4
  
  def initialize(num_rows, num_columns, win_length) 
    @num_rows = num_rows
    @num_columns = num_columns
    @win_length = win_length
  end

  def header
    "A B C D E F G H I J K L M N O P"[0, @num_columns*2]
  end

  def makeBoard ()
    @board = (0..@num_rows).map{(0..@num_columns).map{"x"}}
  end

  def play_game
   @end_game = 0
   puts "Connect 4 with #{@num_rows} #{@num_columns} and #{@win_length}"
   makeBoard()
   playerTurn(@board,1)
  end



  def print_board(board)
    j = 0
    i = 0
    loop do
        if j == @num_rows
          break
        end
        puts "\n"
        loop do
            if i == @num_columns
              break
            end
            print board[i][j]
            i += 1
        end
        i = 0
        j += 1
      end
  end

  def playerTurn(board, playNum)
    print_board(@board)
    puts " "
    chosen_column = gets
    chosen_column = chosen_column.ord - 'a'.ord
    while chosen_column < 0 || chosen_column > @num_columns
      if chosen_column == 16
        puts "Goodbye"
        exit
      end
      puts "Not a valid entry."
      chosen_column = gets
      chosen_column = chosen_column.to_i
    end

    if @board[chosen_column][0] != 'x'
      puts "That column is full. Please choose another"
      playerTurn(@board, playNum)
    end

    j = @num_rows - 1
    loop do
      if j < 0
        break
      end
      if @board[chosen_column][j] == 'x'
        @board[chosen_column][j] = playNum;
        print_board(board);
        break
      end
      j -= 1
    end

    if(winCheck(playNum,chosen_column))
      puts "Congradulations, Player #{playNum}. You Win."
      exit
    end

    if playNum == 1
      playerTurn(@board,2)
    else
      playerTurn(@board,1)
    end
  end

  def checkHorizontal(player, row)
    return checkHV(player, row, @num_columns);
  end

  def checkVertical(player, cols)
    return checkHV(player, cols, @num_rows);
  end

  def checkHV(player,index,stopHere)
    count = 0
    i = 0
    loop do
      if i == stopHere
        break
      end
      if @board[i][index] == player
        count += 1
      else
        count = 0;
      end
      if count >= 4
        @end_game = 1
        break
      end
      i += 1
    end
  end

  def winCheck(player, start)
    checkHorizontal(player,start)
    checkVertical(player,start)
    if @end_game == 1
      return true;
    end
    return false;
  end
end
