//FOR DEMO
	// query form
		// const form = document.getElementById('query-form')

	// text input field
		// const query = document.getElementById('query')

	// set onsubmit
		// form.onsubmit = function (event){
		// 	event.preventDefault();

		// 	// get value in input field
		// 	const queryTerm = query.value;
		// 	console.log(queryTerm);

		// 	getTaggedPhotos(queryTerm);
		// }	

//GENERAL USE
const list = document.getElementById('list-data')
const apiKey = 'JRUdMeWbOkwT5RUzer08CDFjG0BbYBdkSL3ULg6Iq1Ka57v0N3'

//FOR GAME
	const wordpool = ['hills', 'forest', 'lake','beach','mountain', 'pirates','ocean','river','oasis','scenery','landscape','sunrise','sunset','rain','snow','winter','autumn','rainforest','castle','sky','cottage','snowing']
	const button1 = document.getElementById('but1');
	const button2 = document.getElementById('but2');
	const button3 = document.getElementById('but3');
	const button4 = document.getElementById('but4');
	const allButtons = document.querySelectorAll('button');
	const answerZone = document.getElementById('possible-answers')

	const multipleChoice = [];
	let answerWord;	

	answerZone.addEventListener('click', winLogic,false)

// GAMEPLAY FLOW
setupGame()

function setupGame(){
	//Pick 4 words from the array and make a new array
		function shuffleArray(array) {
		    for (var i = array.length - 1; i > 0; i--) {
		        var j = Math.floor(Math.random() * (i + 1));
		        var temp = array[i];
		        array[i] = array[j];
		        array[j] = temp;
		    }
		}

		function selectChoices(){
			shuffleArray(wordpool);
			for(let i = 0; i<4; i++){
				multipleChoice.push(wordpool[i])
			}
		}

	//Pick one of the words to be the answer
		function pickAnswer(){
			ranIndex = Math.floor(Math.random()*multipleChoice.length)
			answerWord = multipleChoice[ranIndex]
		}

	//Pass the words to the buttons and the answer class to the answe
		function populateChoices(){
			for(i=0; i<multipleChoice.length ; i++){
				allButtons[i].innerHTML=multipleChoice[i]
				if(multipleChoice[i]===answerWord){
					allButtons[i].classList.add('answer');
				}	
			}
		}

		selectChoices()
		pickAnswer()
		populateChoices()
		getTaggedPhotos(answerWord);
}


function winLogic(){
	//If the user clicks the right answer
	if(event.target.classList.contains('answer')){
		window.alert("That's right! The answer was "+ answerWord)
		location.reload();
	//Else, tell them to try again
	} else {
		window.alert("Nope! Not that. Try again.")
	}	
}

function getTaggedPhotos(tagName){
	fetch('https://api.tumblr.com/v2/tagged?tag='+ tagName +'&api_key='+apiKey)
			.then(function(response){
				return response.json();
				console.log(response);

				if(!response.ok){
					window.alert('Hey, seems like something went wrong, please contact the site owner')
					return
				}	
			}).then(function(result){
				console.log(result);

				const items = result.response;
			
				for(let i = 0; i<items.length; i++){
					const item = items[i];


					if(item.photos != undefined){
						const altSizes = item.photos[0].alt_sizes
						// const imgSrc = item.photos[0].original_size.url;
						const imgSrc = altSizes[altSizes.length-3].url


						const img = document.createElement('img')
						img.src = imgSrc;

						const li = document.createElement('li');
						
						// li.innerHTML=imgSrc;
						list.appendChild(li);
						li.appendChild(img);

					}

				}
			})
			.catch(function(err){
					window.alert('Hey, seems like the Tumblr API is down, please try again later')
					console.log('message:', err)
				})
}
	