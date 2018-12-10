const closeButton = document.querySelector('.lightbox-close');
const lightbox = document.querySelector('.lightbox');
const galleryItems = document.querySelectorAll('.gallery-item')
const lightboxImage = document.querySelector('.lightbox-image');
const lightboxPrev = document.querySelector('.lightbox-prev');
const lightboxNext = document.querySelector('.lightbox-next');


function hideImage (event){
	event.preventDefault();
	lightbox.classList.add('hidden');
}

function showImage(event){
	// show lightbox
	lightbox.classList.remove('hidden');

	// get current galleryItem
	const elementClickedOn = event.target;
	const galleryItemParent = elementClickedOn.parentElement;

	// replace contents lightbox-image with current image
	lightboxImage.innerHTML = galleryItemParent.innerHTML;
}



// hide lightbox when close button is clicked
closeButton.onclick = hideImage;


// for every gallery item, set onclick handler to gallery image
for(let i = 0; i < galleryItems.length; i++){
	let item = galleryItems[i];
	item.onclick = showImage;
}


// Previous and Next Button Functionality
		// 	console.log(lightboxImage.innerHTML);
		// 	console.log(galleryItems[0].innerHTML)

		// for(let i = 0; i < galleryItems.length; i++){
		// 	if (lightboxImage.innerHTML == galleryItems[i].innerHTML) {
		// 		console.log("It's a match!")
		// 	}
		// }	
		// // When the lightbox is not hidden, figure out which image in an array we are at
		// if 0, no prev
		// if next, replace with next item in the array
		// if previous, replace with previous item in the array

		// if last, no next


