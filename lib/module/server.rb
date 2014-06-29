require 'color_print'
require './mono_talk/config'

module MonoTalk
  class Server
    @routine = Hash.new

    def initialize(servicename,routine)
      @io = STDERR
      @servicename = servicename.to_sym
      @routine = routine

      @io.puts Color.cyan "Command List"
      @routine.each do |key,value|
        @io.puts "#{key} -> #{value}"
      end
    end
    
    def accept
      @server = TCPServer.open(Mono::PORT[@servicename])
      @io.puts 'Acception start, waiting for data...'
      @sock = @server.accept
      @server.close
      begin
        hash = JSON.parse @sock.gets
        @io.puts hash
        @sock.write routing(hash)
      rescue => e
        @io.puts Color.red 'GIVE UP! SOMETHING BAD HAPPEN!'
        @io.puts Color.yellow hash
        @io.puts Color.magenta e 
      ensure
        @sock.close
        @io.puts 'Socket was closed.'
      end
    end

    def test(hash)
      @io.puts Color.yellow "Starting test..."
      @server = TCPServer.open(Mono::PORT[@servicename])
      STDERR.puts 'Acception start, waiting for data...'
      @server.close
      @io.puts hash
      ret = routing(hash)
      @io.puts ret
      @io.puts 'Test was closed.'
      return ret
    end

    def routing(hash)
      return "Undefined command, ABORT -> #{hash['command']}" unless @routine[hash['command']]
      return @routine[hash['command']].call(hash['params'])
    end

    def close
      @server.close
      @io.puts 'Server closed.'
    end
  end
end
