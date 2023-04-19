#######################################################
#
# Harrison Corbin
#
#######################################################

class Connect4():

    num_Cols = 7
    num_Rows = 6

    def __init__(self):
        #defines the board
        self.board = [['x' for i in range(Connect4.num_Cols)] for j in range(Connect4.num_Rows)]

    def print_board(self):
        for i in Connect4.num_Cols:
            print("\n")
            for j in Connect4.num_Rows:
                print(self.board[i][j])

    def winCheck(self, player):
        count = 0

        # check horizontal wins
        for i in range(Connect4.numCols - 1):
            for j in range(Connect4.numRows - 1):
                if self.board[r + count][c] == player:
                    count += 1
                    if r + count >= Connect4.num_Rows:
                        break
                if count >= 4:
                    return True
        count = 0

        # check for vertical wins
        for c in range(Connect4.numCols - 1):
            for r in range(Connect4.numRows - 1):
                if self.board[r][c + count] == player:
                    count += 1
                    if c + count >= Connect4.num_Cols:
                        break
                if count >= 4:
                    return True
        count = 0

        # check for diagonal right wins
        for c in range(Connect4.numCols - 1):
            for r in range(Connect4.numRows - 1):
                if self.board[r + count][c + count] == player:
                    count += 1
                    if r - count <= 0 or c - count <= 0:
                        break
                if count >= 4:
                    return True
        count = 0

        # check for diagonal left wins
        for c in range(Connect4.numCols - 1):
            for r in range(Connect4.numRows - 1):
                if self.board[r - count][c + count] == player:
                    count += 1
                    if r - count >= 0 or c - count >= 0:
                        break
                if count >= 4:
                    return True
                

    def PlayerTurn(board, player):
        board.print_board()
        inp = int(input())
        #Check for a valid input
        while inp > 7 and inp < 0:
            print("Not a valid entry.")
            inp = int(input())
        #if top row is empty
        if board[0][inp] == ' ':
            for i in range(Connect4.num_Cols):
                if board[i][inp] == ' ':
                    board[i][inp] = player
                    break
        else:
            print("That column is full. Please choose another")
        if Connect4.winCheck(board, player):
            print ("Congradulations, Player #{player}. You Win.")
            exit
        if player == 1:
            Connect4.PlayerTurn(board, 2)
        else:
            Connect4.PlayerTurn(board,1)