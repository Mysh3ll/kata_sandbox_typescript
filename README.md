# GoblinsAtCode's kata sandbox (@Maeevick)

A very simple boilerplate to have fun with kata and experiments

### Experimental `fork.sh` script

**helper to fork the boilerplate on your repository** (:warning: _at your own risks, but not so high !_ :heart:)

```shell
sh fork.sh
```

- _do you wish to perform migration ?_
- _what's the url of the target remote ?_
    - then script will change the remote url
    - reset the branch
    - amend the boilerplate in the first commit
- _do you want to push now ?_
    - push it on your main branch on your repository

:arrow_right: **Note**: feel free to improve it and submit PR, it's far from perfect :heart:

### Requirements

- _With Docker_
    - make
    - docker && docker-compose
- _Without Docker_
    - node
    - npm/yarn

:arrow_right: **Note**: you could run the commands with `npm` or `make` with docker-compose. _Make_ raises the container with docker-compose, executes the task and removes the container.

### Main scripts

:warning: **Warning**: we decided to switch from yarn 1.22 to npm due to problems to manage dependencies between Jest 27 and Stryker 5

:arrow_right: **Obvious Note**: require to install dependencies
```shell
npm i
or
make install
```
- **execute a typescript program / file** (_works on javascript program too_) 
```shell
npm run start [your file/entry point]

npm run start src/welcome.ts # for example
or
make start ARGS="src/welcome.ts"
```

- **execute all tests files once** 
```shell
npm run test
or
make test
```

- **execute all tests files** (_impacted by changes_) **in watch mode** (a.k.a. on save) 
```shell
npm run test:watch
or
make test-watch
```

- **execute mutation testing** 
```shell
npm run test:mutate
or
make test-mutate
```
:arrow_right: **Note**: configured with very high threshold, you can change them in : `stryker.conf.json`

- **execute all the CI's workflow** (tsc for transpilation, eslint for linter, test:coverage and test:mutate) 
```shell
npm run ci
or
make ci
```

:warning: **Warning**: Mutation Testing may be very time consuming

### Reports

- **traditional coverage report generated by** `jest` **is in** `/reports/coverage/lcov-report/`

:warning: **Warning**: Coverage report is not 100% trustable, as you may know, it displays only the code covered by execution, **coverage doesn't mean : this code is tested, it means this code has been executed during tests !!**

- **mutation testing report generated by** `stryker` **is in** `/reports/mutation/html/`

:warning: **Warning**: Mutation testing challenges your tests and your coverage, report is more relevant than "traditional coverage" however it's not silver bullet (read documentation [here](https://stryker-mutator.io/) about limitations)

- **train your Test-Driven Development techniques**, step by step you will need less and less Coverage and Mutation Testing because **great TDD (_and TCR_) is best way to have only useful tested code in a fast and trustable manner.** 

### Linter

- Eslint uses mainly the `standard` and `recommended` set of rules, with few personnal preferences, feel free to change it in : `.eslintrc.json` to be confortable.

- **execute eslint check** 
```shell
npm run lint:check
or
make lint-check
```

- **execute eslint fix** 
```shell
npm run lint:fix
or
make lint-fix
```

:warning: **Warning**: If you execute the command `make test-watch` make sure to exit with the `q` and not with `Ctrl C`, otherwise the docker container will not be destroyed.