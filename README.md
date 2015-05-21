# Burn Note
Send self destructing notes! A proof-of-concept app written in 100 lines of code (excluding boilerplate stuff and vendor files.).

## Installation
Clone this repo and run these commands (make sure you have node, npm, bower, grunt, coffee installed globally):

```bash
npm install && bower install && grunt && coffee ./backend.coffee
````

Then visit http://127.0.0.1:8080/

## Line Count
Run this command to prove the app is 100 lines of code.

```bash
cat backend.coffee frontend/app/**/* | sed '/^\s*$/d' | wc -l
````

It should return exactly `100`.
