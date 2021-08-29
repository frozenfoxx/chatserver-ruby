#!/usr/bin/env ruby
require 'socket'

class ChatServer
  def initialize
    @host = '0.0.0.0'
    @port = 8080
        
    @messages = []
    @userList = {}

  end

  def start
    puts "Launching chat server..."

    server = TCPServer.new(@host, @port)

    loop do
      client = server.accept    # Wait for a client to connect
      
      Thread.new do
        puts "A user just connected"
      
        client.puts "Welcome to my chat server! What is your nickname?"

        clientName = getClientName(client)
        
        respond(clientName, client)
      end
    end
  end

  # Validate the name
  def getClientName(client)
    while true
      clientName = client.gets.chomp
      puts "Client gave us #{clientName}"

      unless @userList.include?(clientName)
        @userList[clientName] = client
        return clientName
      else
        client.puts "Sorry, that name is taken, please input a new name"
      end
    end
  end

  def respond(clientName, client)
    
    while true
      # Receive new message
      message = client.gets

      @userList.each do |k, clientHandle|
        unless clientHandle == client
          clientHandle.puts "[#{Time.now}] <#{clientName}> #{message}"
        end
      end
    end
  end
end

if __FILE__ == $0
    cs = ChatServer.new
    cs.start
end
