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
        break
      end
      j -= 1
    end

    if(winCheck(playNum))
      puts "Congratulations, Player #{playNum}. You Win."
      exit
    end

    if playNum == 1
      playerTurn(@board,2)
    else
      playerTurn(@board,1)
    end
  end

  def checkVertical(player)
    i = 0
    j = 0
    count = 0
    loop do
      
      if i > @num_rows
        break
      end
      loop do
        if j > @num_columns
          break
        end
        while @board[i][j + count] == player
          count += 1
          #puts @board[i][j + count]
          if j + count >= @num_columns
            break
          end
        end
        if count >= @win_length
          @end_game = 1
          break
        end
        #puts count
        count = 0
        j += 1
      end
      j = 0
      i += 1
    end
  end

  def checkHorizontal(player)
    i = 0
    j = 0
    count = 0
    loop do
      if i >= @num_rows
        break
      end
      loop do
        #puts j
        if j >= @num_columns 
          break
        end
        #puts @board[i - count][j]
        while @board[i + count][j] == player
          count += 1
          #puts @board[i][j + count]
          if i + count >= @num_rows
            break
          end
        end
        puts count
        if count >= @win_length
          @end_game = 1
          return
        end
        count = 0
        j += 1
        #puts j
      end
      j = 0
      i += 1
    end
    i = 0
  end

  def checkDiagonalL(player)
    i = 0
    j = 0
    count = 0
    loop do
      if i >= @num_rows
        break
      end
      loop do
        if j > @num_columns
          break
        end
        while @board[i + count][j + count] == player
          count += 1
          #puts count
          #puts @board[i][j + count]
          if j + count > @num_columns || i + count > @num_rows 
            break
          end
        end
        if count >= @win_length
          @end_game = 1
          return
        end
        if player == 1
          #print count
        end
        count = 0
        j += 1
      end
      puts ""
      j = 0
      i += 1
    end
  end

  def checkDiagonalR(player)
    i = 0
    j = 0
    count = 0
    loop do
      if i > @num_rows
        break
      end
      loop do
        if j > @num_columns
          break
        end
        while @board[i - count][j + count] == player
          count += 1
          #puts @board[i][j + count]
          if j + count >= @num_columns || i - count < 0
            break
          end
        end
        if count >= @win_length
          @end_game = 1
          return
        end
        puts count
        count = 0
        j += 1
      end
      j = 0
      i += 1
    end
  end

  def winCheck(player)
    checkHorizontal(player)
    checkVertical(player)
    checkDiagonalL(player)
    checkDiagonalR(player)
    if @end_game == 1
      return true;
    end
    return false;
  end
end