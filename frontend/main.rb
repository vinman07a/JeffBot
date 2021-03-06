#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require 'rack-flash'
require_relative 'lib/groupme'
require_relative 'lib/mqwrapper'

set :port, ENV['PORT'] || 8080
set :bind, ENV['IP'] || '0.0.0.0'

#enable :sessions
#use Rack::Flash

##
# Startup code
GroupMe.broadcast("JeffBot has been successfully updated.")
##

##
# Index page of site featuring chat window.
get '/' do
   slim :chathome 
end

##
# Simple API endpoint for getting response to query
post '/api/v1/post' do
    MQWrapper.send(params[:args])
end

post '/api/v1/extern/groupme' do
    request.body.rewind
    inbound_payload = JSON.parse(request.body.read)
    inbound_message = inbound_payload["text"]
    inbound_sender = inbound_payload["name"]
    if inbound_message.split(" ")[0].eql?("@" + ENV["GROUPME_BOT_NAME"])
        payload = MQWrapper.send(inbound_message.sub("@" + ENV["GROUPME_BOT_NAME"] + " ", ""))
        GroupMe.send(inbound_sender, payload)
    end
end