const { isLibrary } = require('../example');

describe('Example', () => {
  it('is a library', () => {
    expect(isLibrary()).toBeTruthy();
  });
});
