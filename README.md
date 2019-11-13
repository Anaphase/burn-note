# Burn Note
Send self destructing notes! A proof-of-concept app written in 100 lines of code (excluding boilerplate stuff and vendor files.)

## Installation
Clone this repo and run this command:

```bash
npm install && npm start
````

Then visit http://localhost:8080/

## Line Count
Run this command to prove the app is 100 lines of code.

```bash
cat backend.coffee frontend/app/**/* | sed '/^\s*$/d' | wc -l
````

It should return exactly `100`.
