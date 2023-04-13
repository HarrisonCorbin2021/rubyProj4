def print_board(board)
    j = 0
    loop do
        if j == num_rows
          break
        end
        puts " "
        loop do
            if i == num_columns
              break
            end
            print board[i][j]
            i++
        end
        j++
      end
  end