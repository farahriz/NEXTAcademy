def player_choice(gameboard, player, player_is_x)
	victory = false
	while victory == false 

	#ask player to choose box to fill
	p 'Please enter a position from 0-8'
	gamebox = gets.chomp.to_i

	if gameboard[gamebox] == ' ' then
		gameboard[gamebox] = player
		# print gameboard
		p gameboard[0..2]
		p gameboard[3..5]
		p gameboard[6..8]

		#this change the sequence of players
		if player_is_x == true then
			player_is_x = false
			p 'It is now player 2 turns'
		else
			player_is_x = true
			p 'It is player 1 turns'
		end

		#change the symbol every turn
		if player_is_x == true then
			player = 'x'
		else 
			player = 'o'
		end

	else #if player enter a valid position, print error message
		p 'Please enter a valid position'
	end

	#check if board is full
	full_board = false
	if gameboard.include?(' ')==false
		full_board = true
	end


	#jump to function win_condition to check if any player wins of tie 
	check_win = win_condition(gameboard)

		#print message on game outcome
		if check_win == 'no one' && full_board
			victory = true
			p "it's a tie!"
		elsif check_win == 'player1' then 
			victory = true
			p 'player 1 wins!'
		elsif check_win == 'player2' then 
			victory = true
			p 'player 2 wins!'
			
		end
	end

end

def win_condition(gameboard)
	
	#every possible outcome for player 1 to win the game
	player1 = (gameboard[0]+gameboard[1]+gameboard[2])=='xxx' || (gameboard[3]+gameboard[4]+gameboard[5]) == 'xxx' || (gameboard[6]+gameboard[7]+gameboard[8]) == 'xxx' || (gameboard[0]+gameboard[3]+gameboard[6]) == 'xxx' || (gameboard[1]+gameboard[4]+gameboard[7]) == 'xxx' || (gameboard[2]+gameboard[5]+gameboard[8]) == "xxx" || (gameboard[0]+gameboard[4]+gameboard[8]) == "xxx" || (gameboard[2]+gameboard[4]+gameboard[6]) == "xxx"
	#every possible outcome for player 2 to win the game
	player2 = (gameboard[0]+gameboard[1]+gameboard[2])=='ooo' || (gameboard[3]+gameboard[4]+gameboard[5]) == 'ooo' || (gameboard[6]+gameboard[7]+gameboard[8]) == 'ooo' || (gameboard[0]+gameboard[3]+gameboard[6]) == 'ooo' || (gameboard[1]+gameboard[4]+gameboard[7]) == 'ooo' || (gameboard[2]+gameboard[5]+gameboard[8]) == "ooo" || (gameboard[0]+gameboard[4]+gameboard[8]) == "ooo" || (gameboard[2]+gameboard[4]+gameboard[6]) == "ooo"

	#return the result
	if player1 || player2 then
		if player1
			return 'player1'
		else
			return 'player2'
		end
	end

	if (player1 && player2) == false
		return 'no one'
	end
end


def main()
	# sets up main game
	player_is_x = false
	gameboard = [' ', ' ', ' ', ' ',  ' ', ' ', ' ', ' ', ' ']
	#ask player 'x' or 'o'
	p "Hello, players"
	p "Player 1, please choose 'X' or 'O'" 
	player = gets.chomp.to_s


	# initialise player
	if player == 'x'
		player_is_x = true
	else 
		player_is_x = false
	end

	# run function to start game
	player_choice(gameboard, player, player_is_x)
end

main