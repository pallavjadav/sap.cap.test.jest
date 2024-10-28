// mytest2.test.js
const randomNumber = require('./jest.setup');

test('another test using singleton random number', () => {
    expect(randomNumber).toBeLessThanOrEqual(100);
    console.log('Consistent random number:', randomNumber);
});
