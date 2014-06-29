require "module/module"
require './mono_talk/config.rb'

module MonoTalk
  class Client
    @@retry = 5

    def initialize(servicename)
      @io = STDERR
      servicename = servicename.to_sym
      @host = Mono::check_local(Mono::HOST[servicename])
      @port = Mono::PORT[servicename]
      @status = :close

      @io.puts "Connect to #{@host}:#{@port}"
      
      (@@retry+1).times do |index|
        begin
          open(@host,@port)
          break
        rescue
          if index > @@retry
            raise "Connection failed."
          end
          @io.puts "Connection failed, retrying connect to server... [#{index}]"
          sleep 1
        end
      end
      @io.puts "Connection successful."
    end

    def open(host=@host,port=@port)
      if @status == :close
        @client = TCPSocket.open(host, port) 
        @status = :open
      end
    end

    def write(command_hash)
      open()
      @client.write(JSON.generate(command_hash)+"\n")
      @io.puts ret = @client.gets.gsub("$n","\n")
      @client.close
      @status = :close
      @io.puts 'Connection closed.'
      return ret
    end
  end
end
