// mytest1.test.js
const randomNumber = require('./jest.setup');

test('test using singleton random number', () => {
    expect(typeof randomNumber).toBe('number');
    console.log('Random number:', randomNumber);
});
