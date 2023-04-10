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

  def play_game
   puts "Connect 4 with #{@num_rows} #{@num_columns} and #{@win_length}"
  end

  def print_board(board)
    for (j = num_rows; j >= 0; j--)
        puts " "
        for (i = 0; i < 7; i++)
            print board[i][j]
        end
      end
  end

  def playerTurn(Board, playNum)
    chosen_column = gets
    chosen_column = (int)(toupper(c) - 'A')
    while (chosen_column < 0 || chosen_column >)
      if(chosen_column == 16)
        puts "Goodbye"
      end
      puts "Not a valid entry."
      chosen_column = gets
      chosen_column = (int)(toupper(c) - 'A')
    end

    if (Board[num_columns][chosen_column] != 'x')
      puts "That column is full. Please choose another"
      playerTurn(Board, play_Num)
    end

    for (j = 0; j < num_columns; j++)
      if (board[j][chosen_column] == 'x')
        board[j][chosen_column] == play_Num;
        print_board(board);
        
      end
    end
    if(winCheck(play_Num,chosen_column,end_game))
      puts "Congradulations, Player #{playNum}. You Win."
    end
  end

  def checkHorizontal(player, row)
    return checkHV(player, row, num_columns);
  end

  def checkVertical(player, cols)
    return checkHV(player, cols, num_rows);
  end

  def checkHV(player,index,stopHere)
    count = 0
    for (i = 0; i < stopHere; i++)
      if(board[i][index] == player)
        count++;
      end
      else
        count = 0;
      end
      if(count >= 4)
        end_game = 1;
        break;
      end
  end

  def winCheck(player, start, end_game)
    checkHorizontal(player,start)
    checkVertical(player,start)
    if(end_game == 1)
      return true;
    end
    return false;
  end
end
