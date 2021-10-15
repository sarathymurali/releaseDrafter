module.exports = {
  rootDir: "./src",
  collectCoverage: true,
  coverageDirectory: '<rootDir>/../coverage',
  coverageReporters: [
    "text",
    "cobertura",
    "lcov"
  ],
  coverageThreshold: {
    global: {
      branches: 100,
      functions: 100,
      lines: 100,
      statements: 100
    }
  },
  testMatch: ["**/__tests__/**/*.js"]
};
