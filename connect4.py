#######################################################
#
# Harrison Corbin
#
#######################################################
import sys

class Connect4():

    num_Cols = 7
    num_Rows = 6
    board = [['x' for i in range(0, 7 , 1)] for j in range(0, num_Rows, 1)]
        
    def print_board(board):
        for i in range (0, Connect4.num_Cols - 1, 1):
            #sys.stdout.write(str(i))
            print("\n")
            for j in range(0, Connect4.num_Rows, 1):
                sys.stdout.write(str(board[i][j]))

    def winCheck(board, player):
        count = 0

        # check horizontal wins
        for i in range(Connect4.num_Cols - 1):
            for j in range(Connect4.num_Rows - 1):
                if i + count >= Connect4.num_Rows:
                    while board[i + count][j] == player:
                        count += 1
                        if i + count >= Connect4.num_Rows:
                            break
                    if count >= 4:
                        return True
        count = 0

        # check for vertical wins
        for c in range(Connect4.num_Cols - 1):
            for r in range(Connect4.num_Rows - 1):
                if c + count >= Connect4.num_Rows:
                    while board[r][c + count] == player:
                        count += 1
                        if c + count >= Connect4.num_Cols:
                            break
                    if count >= 4:
                        return True
        count = 0

        # check for diagonal right wins
        for c in range(Connect4.num_Cols - 1):
            for r in range(Connect4.num_Rows - 1):
                if r + count <= 0 or c + count <= 0:
                    while board[r + count][c + count] == player:
                        count += 1
                        if r + count <= 0 or c + count <= 0:
                            break
                    if count >= 4:
                        return True
        count = 0

        # check for diagonal left wins
        for c in range(Connect4.num_Cols - 1):
            for r in range(Connect4.num_Rows - 1):
                if r - count >= 0 or c + count >= Connect4.num_Cols - 1:
                    while board[r - count][c + count] == player:
                        count += 1
                        if r - count >= 0 or c + count >= Connect4.num_Cols:
                            break
                    if count >= 4:
                        return True
                    

    def PlayerTurn(board, player):
        Connect4.print_board(board)
        print("\n")
        inp = input()
        inp = ord(inp[0]) - ord("a")
        #Check for a valid input
        while inp > 7 and inp < 0:
            if inp == 16:
                print("Goodbye.")
                exit()
            print("Not a valid entry.")
            inp = int(input())
        #if top row is empty
        if board[0][inp] == 'x':
            for i in range(Connect4.num_Cols - 2, 0, -1):
                if board[i][inp] == 'x':
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

if __name__ == '__main__':
    board = Connect4.board
    #board.print_board()
    Connect4.PlayerTurn(board,1)