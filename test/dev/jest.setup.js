// randomNumberSingleton.js
let randomNumber;

function getRandomNumber() {
    if (randomNumber === undefined) {
        randomNumber = Math.floor(Math.random() * 100);
    }
    return randomNumber;
}

module.exports = getRandomNumber();
