// VARIABLES FOR GAME LOGIC
let wordToGuess = 'potato';
const vegetableArray = ['potato', 'tomato', 'celery', 'turnip', 'cabbage', 'lettuce', 'onion', 'spinach']
const wordState = []
let guessesLeft = 6;
const prevGuesses = [ ];

// HTML ELEMENTS
const wordInProgress = document.getElementById('word')
const lettersGuessed = document.getElementById('past-guesses')
const livesLeft = document.getElementById('lives-left')
const submitForm = document.getElementById('submission')
const myInput = document.getElementById('my-input')
const winLoseMessage = document.getElementById('victory-banner')
const myTrap = document.querySelector('.trap')

// FUNCTIONS

	//Set Up
		function generateRandomWord(){
			wordToGuess = vegetableArray[(Math.floor(Math.random()*vegetableArray.length))]
		}

		function setWordState(){
			for (let i = 0; i<wordToGuess.length; i++){
				wordState.push(undefined)
			}
			displayWordState(wordState);
		}

		generateRandomWord();
		setWordState();
		livesLeft.innerHTML = guessesLeft


submitForm.onsubmit = function(event){
	event.preventDefault();
	checkInput(myInput.value);
	myInput.value = '';
}
	

function displayWordState(state) {
	let output = '';
	// Construct new word state
	for(let i = 0; i < state.length; i++){
		const char = state[i];
		if (char!=undefined){
			output = output + char
		} else {
			output = output + '_'
		}
	}
	// replace HTML for game in progress
	wordInProgress.innerHTML = output;
}


//Victory Condition
function checkVictory(){
	if (!(wordState.includes(undefined)) && guessesLeft > 0){
		winLoseMessage.classList.remove('hidden')
		// Update HTML for win event
		makeItRain();

		return
	} else if (guessesLeft == 0) {
		// Update HTML for loss event
		winLoseMessage.innerHTML= 'You lost! Better luck next time! Check the console if you are very curious.';
		myTrap.setAttribute("style", "background-color: red")
		winLoseMessage.classList.remove('hidden')
		console.log('The answer was '+ "'" + wordToGuess + "'")
	} else {
		// console.log('Hang in there!')
		// don't do anything to the HTML
	}
}

// update word state for new guesses
function updateWordState(letter){	
	const positionArray = [];
	for (let i = 0; i < wordToGuess.length; i++){
		if (letter==wordToGuess.charAt(i)) {
			positionArray.push(i);
		}
	}
	for (let i = 0; i < positionArray.length; i++){
		wordState[positionArray[i]] = letter;
	}
}


function addGuess(letter){
	prevGuesses.push(letter)
	//if guess isn't a letter in wordToGuess, subtract a life
	if (wordToGuess.includes(letter)===false){
		guessesLeft = guessesLeft - 1;

	} else {
		// replace correctly guessed letter into the word state
		updateWordState(letter);
	}

	//update HTML for lives left section
	displayWordState(wordState);		
	checkVictory();
	livesLeft.innerHTML = guessesLeft;

	//add to your list of guessed
	const newGuess = document.createElement('li');
	newGuess.innerHTML = letter;
	lettersGuessed.appendChild(newGuess); //append a child
}



// prevent user from submitting invalid input
function checkInput(string){
	const str = string.toLowerCase();
	// There has to be a better way to check it's a letter between A-Z, right?
	const alphabet = ['a', 'b', 'c', 'd','e', 'f', 'g', 'h','i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
	// is string 1 character and a letter between a to z?
	if (alphabet.includes(str) && !prevGuesses.includes(str)) {
		//has it been guessed before
		addGuess(string);
	} else {
		window.alert("This is not a valid guess. Make sure you only guess single letters, and make sure it's not something you guessed already.")
		return
	}
}

