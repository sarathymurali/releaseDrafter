# Hello World NPM Library

This is a simple Node.js project employing a Jenkins CI pipeline, with standards for lint/unit testing and publishing to Artifactory. It can be used as a starting point for any shared internal packages.

## Available Scripts

In the project directory, you can run:

### `npm run lint`

Runs eslint against the package. By default we use "ES6" syntax.

### `npm run unit`

Runs jest unit testing against the package. Collects code coverage in the `/coverage` directory.

### `npm test`

Runs linting, unit testing and auditing scripts. This command is gating during the CI pipeline, so you should run it before committing any changes.

## Docker

The Docker environment in this repository is only used by Jenkins at build time. This ensures we are compiling the application with a consistent version of Node, independently of whatever version may be installed on the Jenkins slave itself.
