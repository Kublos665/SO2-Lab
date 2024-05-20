import random


def is_player_starting():
    return random.choice([True, False])

def get_user_move(board):
    board_tab = [board[i:i+5] for i in range(0, 25, 5)]
    
    while True:
        try:
            move = int(input("Podaj numer pola (0-24): "))
            if move < 0 or move > 24:
                print("Liczba ma byc w przedziale od 0 do 24.")
                continue

            row = move // 5
            col = move % 5
            
            if board_tab[row][col] != ' ':
                print("Pole zajete.")
            else:
                board_tab[row][col] = 'X'
                return [cell for row in board_tab for cell in row]
        except ValueError:
            print("Niepoprawny input.")


def ai_move(board):
    board_tab = [board[i:i+5] for i in range(0, 25, 5)]
    empty_fields = [(row, col) for row in range(5) for col in range(5) if board_tab[row][col] == ' ']
    move = random.choice(empty_fields)
    board_tab[move[0]][move[1]] = 'O'
    
    return [cell for row in board_tab for cell in row]
    
    
def new_board():
    return [' '  for i in range(25)]


board = new_board()
players_move = is_player_starting()
print(board)
board = ai_move(board)
print(board)
board = get_user_move(board)
print(board)
print(players_move)