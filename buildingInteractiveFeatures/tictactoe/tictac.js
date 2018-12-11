// Define clickable elements
	const softReset = document.getElementById('soft-reset');
	const hardReset = document.getElementById('hard-reset');

	const player1Score = document.getElementById('player1-score');
	const player2Score = document.getElementById('player2-score');
	const playerTieScore = document.getElementById('tie-score');
	const playingGrid = document.querySelector('table');
	const allPlayingSquares = document.querySelectorAll('td');


	const conversionKey = {
		a: 0,
		b: 1,
		c: 2
	}

	playingGrid.addEventListener('click',runGame,false)

	function runGame(event){
		wasClicked() ? invalidMove() : markInHTML()
	}

// Define key variables for game logic
	let playerXturn = true;

	let xScore = 0;
	let oScore = 0;
	let tieScore = 0;

	//nested variables for determining if testing should stop
		let didXWin = false;
		let didOWin = false;

	//For purposes of testing columns
		let virtualGridTranspose = [];
		let column1 = [];
		let column2 = [];
		let column3 = [];

	// Sets up empty playing field
		const virtualGrid = [ 
			[' ',' ',' '], 
			[' ',' ',' '], 
			[' ',' ',' '] 
		]

	// Basic game logic
		function isX(value){
			return value == 'X'
		}

	function isO(value){
			return value == 'O'
		}

	//Reset Buttons
		softReset.onclick = function(){
			clearGrid();
		}

		hardReset.onclick = function(){
			clearHard();
		}


function invalidMove(){
	window.alert("That is an invalid move. You cannot undo what was already done. Click an empty square")
}

function markInHTML(){
	let targetRow = event.target.id[0];

	if(playerXturn==true){
		event.target.classList.add('cross')
		putMark(conversionKey[targetRow],event.target.id[1]-1,'X')
	} 

	if(playerXturn==false){
		event.target.classList.add('nought')
		putMark(conversionKey[targetRow], event.target.id[1]-1,'O')
	}

	changePlayer()
}


function wasClicked(){
	return event.target.classList.contains('nought') || event.target.classList.contains('cross')
}


// Player marks spot in grid with X or O
function putMark(row, column, sign){
	// if(virtualGrid[row][column] == ' '){
		
			// mark the javascript grid
			virtualGrid[row][column]=sign;

			// check if anyone won
			checkVictory()
		// } 
}

// Toggle player
function changePlayer(){
	playerXturn=!playerXturn;
	console.log(playerXturn);
}

//What to do if someone wins
	function victoryEvent(){
		if(didOWin==true){
			oScore = oScore + 1;
			player2Score.innerHTML=oScore;
			gameEnded()
		}
		if(didXWin==true){
			xScore = xScore + 1;
			player1Score.innerHTML=xScore;
			gameEnded()
		}

	}

	function tieEvent(){
		tieScore = tieScore + 1;
		playerTieScore.innerHTML = tieScore;
		gameEnded()
	}


//Functions that check if we have three of something in a row
	function checkRows(){
		for(let i=0; i<virtualGrid.length; i++){
			didXWin = virtualGrid[i].every(isX);
			// console.log("Did X Win? " + didXWin)
			didOWin = virtualGrid[i].every(isO);
			if (didXWin || didOWin){
				return
			}
			// console.log("Did O Win? " + didOWin)
		}	
	}

	function checkColumn(){
		function constructColumn(){
			let columnA = [] ;
			let columnB = [];
			let columnC = [];
			for(let i=0; i<virtualGrid.length; i++){
				columnA.push(virtualGrid[i][0])
			}
			for(let i=0; i<virtualGrid.length; i++){
				columnB.push(virtualGrid[i][1])
			}
			for(let i=0; i<virtualGrid.length; i++){
				columnC.push(virtualGrid[i][2])
			}

			column1=columnA;
			column2=columnB;
			column3=columnC;
			virtualGridTranspose = [column1, column2, column3]
		}

		constructColumn();
		if (column1.every(isX) || column1.every(isO)){
			didXWin=column1.every(isX);
			didOWin=column1.every(isO);
			return
		}

		if (column2.every(isX) || column2.every(isO)){
			didXWin=column2.every(isX);
			didOWin=column2.every(isO);
			return
		}

		if (column3.every(isX) || column3.every(isO)){
			didXWin=column3.every(isX);
			didOWin=column3.every(isO);
			return
		}

	}

	function checkDiagonal(){
		//construct diagonal
		let diagonal1 = [virtualGrid[0][0], virtualGrid[1][1], virtualGrid[2][2]];
		let diagonal2 = [virtualGrid[2][0], virtualGrid[1][1], virtualGrid[0][2]];

		//test diagonal
		didXWin = ( diagonal1.every(isX) || diagonal2.every(isX) );
		didOWin = ( diagonal1.every(isO) || diagonal2.every(isO) );

		// console.log("Did X Win? " + didXWin)
		// console.log("Did O Win? " + didOWin)
	}

	function checkFullBoard(){
	return !(virtualGrid[0].includes(' ') || virtualGrid[1].includes(' ') || virtualGrid[2].includes(' '))
	}

//Function to check for all possible win configurations
	function checkVictory(){
		//Has anybody won yet?
		if(didOWin || didXWin){
			//If yes, play victory event
			victoryEvent();
			return
			//If no, then check the rows
		} else {
			checkRows()

			//Now Has anybody won yet?
			if(didOWin || didXWin){
				//If yes, start the victory event
				victoryEvent()
				return
				  //If no, check the columns
				} else {
					checkColumn();
					
					//Has anybody won now that we've checked the columns?
					if(didXWin || didOWin){
						//If yes, skip to victory 
						victoryEvent()
						return;

					//If no, check the diagonal	
					} else {
						checkDiagonal()

						//Has anybody won now that we've checked the diagonal?
						if(didXWin || didOWin){
							//If yes, the skip to victory
							victoryEvent();
							return;

						//If no
						} else {
							//Are all cells filled? If yes activate the tie event
							if(checkFullBoard()){
								tieEvent();
								return;
							} else {
								//If no, do nothing and let the players keep playing
							}
						}
					}	
				}
		}
	} // this is the closing bracket for the function


// clear the gameBoard
	function clearGrid(){
		// clear javascript
		for(let i=0; i<virtualGrid.length; i++){
			virtualGrid[i]=[' ', ' ', ' ']
		}

		// clear html 
		for (let i=0; i<allPlayingSquares.length; i++){
				if(allPlayingSquares[i].classList.contains('nought')){
					allPlayingSquares[i].classList.remove('nought');
				}
				if(allPlayingSquares[i].classList.contains('cross')){
					allPlayingSquares[i].classList.remove('cross');
				}

			allPlayingSquares[i].classList.remove('unclickable');
			playingGrid.classList.remove('unclickable')
		}


		didXWin = false;
		didOWin = false;
	}

// start over from 0 for everything
	function clearHard(){
		victory = false;
		playerXturn = true;

		xScore = 0;
		oScore = 0;
		tieScore = 0;

		player1Score.innerHTML=xScore;
		player2Score.innerHTML=oScore;
		playerTieScore.innerHTML=tieScore;

		clearGrid()
	}


//prevent playing when someone has won
	function gameEnded(){
		for (let i=0; i<allPlayingSquares.length; i++){
			allPlayingSquares[i].classList.add('unclickable')
		}

		playingGrid.classList.add('unclickable')

		setTimeout(function() {
		  window.alert("The game is over! Play another round or reset everything");
		}, 0)
	}