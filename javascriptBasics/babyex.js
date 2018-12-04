var firstName = "Rangelo";
var lastName = "Deacon";
var fullName = firstName + " " + lastName;
console.log(fullName);
var nameLength = fullName.length;
console.log("The length of the child's full name is: " + fullName.length);
var pos = nameLength/2;
var midPos = Math.round(pos)-1;
console.log("The middle character of the full name is: " + fullName[midPos]);
var fullNameLowerCase = fullName.toLowerCase()
console.log(fullNameLowerCase)