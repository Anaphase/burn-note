fs = require 'fs'
shortid = require 'shortid'
express = require 'express'
bodyParser = require 'body-parser'
app = express()

app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

app.use express.static 'frontend/public'

app.get '/message/:id', (request, response) ->

  file = "messages/#{request.params.id}.txt"

  fs.readFile file, 'utf-8', (error, message) ->
    return apiError response, 'message not found' if error

    fs.unlink file, (error) ->
      return apiError response, 'message could not be deleted, try again later' if error
      response.json 'error': null, 'message': message

app.post '/message', (request, response) ->

  return apiError response, 'message is required' unless request.body?.message?

  id = shortid.generate()
  file = "messages/#{id}.txt"

  fs.writeFile file, request.body.message, (error) ->
    return apiError response, 'message could not be created, try again later' if error
    response.json 'error': null, 'id': id

apiError = (response, error) -> response.json('error': error)

server = app.listen process.env.PORT or 8080, -> console.log 'Listening at http://%s:%s', server.address().address, server.address().port
