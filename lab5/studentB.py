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
    
    for row in range(5):
        for col in range(5):
            if board_tab[row][col] == ' ':
                board_tab[row][col] = 'O'
                if check_victory(board_tab, 'O'):
                    return [cell for row in board_tab for cell in row]
                else:
                    board_tab[row][col] = ' '
    
    for row in range(5):
        for col in range(5):
            if board_tab[row][col] == ' ':
                board_tab[row][col] = 'X'
                if check_victory(board_tab, 'X'):
                    board_tab[row][col] = 'O'
                    return [cell for row in board_tab for cell in row]
                else:
                    board_tab[row][col] = ' '
    
    empty_fields = [(row, col) for row in range(5) for col in range(5) if board_tab[row][col] == ' ']
    if not empty_fields:
        raise ValueError("The board is full, no moves possible")
    move = random.choice(empty_fields)
    board_tab[move[0]][move[1]] = 'O'
    new_board = [cell for row in board_tab for cell in row]
    
    return new_board

def check_victory(board, mark):
    for i in range(5):
        if all(board[i][j] == mark for j in range(5)) or all(board[j][i] == mark for j in range(5)):
            return True
    if all(board[i][i] == mark for i in range(5)) or all(board[i][4-i] == mark for i in range(5)):
        return True
    return False