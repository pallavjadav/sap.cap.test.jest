# Getting Started

This project focuses on writing SAP CAP testing scripts using framework like Mocha and Jest. 

## References:

- [SAP CAPIRE cds.test()](https://cap.cloud.sap/docs/node.js/cds-test)
- [JEST](https://jestjs.io/docs/using-matchers)

## Follow steps to run the project
- Install Dependency

```bash
npm ci
```

- Run test 

```bash
npm test
```

## Chai Expect Guide

- [Expect](https://www.chaijs.com/guide/styles/#expect)
- 

## Important Jest Commands

```bash
npx jest --watchAll --verbose --coverage --bail --runInBand
```

### Breakdown:
- ```--watchAll```: Automatically re-runs tests when any source code or test file changes, so you don't have to keep restarting tests manually.
- ```--verbose```: Displays individual test results, including a breakdown of passing and failing tests, which helps with understanding test coverage and debugging.
- ```--coverage```: Helps monitor how much of your code is covered by tests, which is important for writing robust tests.
- ```--bail```: Stops running tests after the first failure. This is useful for quick debugging, as you can immediately focus on fixing the first issue.
- ```--runInBand```: Runs tests sequentially in the same process, avoiding issues with shared resources such as databases or file systems that might occur with parallel tests.

### Why This Combination?

- ```--watchAll``` saves time by automatically running tests as you modify code.
- ```--verbose``` makes it easy to understand what happened during the test run, especially for a beginner who wants to learn how tests are structured.
- ```--coverage``` encourages writing comprehensive tests by showing untested areas of your code.
- ```--bail``` ensures you don’t get overwhelmed with too many failing tests, allowing you to fix one issue at a time.
- ```--runInBand``` avoids confusing errors that can arise from running tests in parallel when not properly configured, especially in stateful SAP CAP environments.