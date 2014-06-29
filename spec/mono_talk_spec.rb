$LOAD_PATH.unshift File.expand_path('./lib')
require 'module/server'
require 'module/client'
require 'module/consts'
require 'mono_talk/version'

server = MonoTalk::Server.new(:test,MonoTalk::SAMPLE_ROUTINE)

describe MonoTalk do
  it 'has a version number' do
    expect(MonoTalk::VERSION).not_to be nil
  end
  
  it 'should be "Test succeed."' do 
    expect(server.test({"command" => "TEST"}) == "Test succeed.").not_to be false
  end

  it 'should be run expectedly.' do
    client = nil
    t = Thread.new do
      client = MonoTalk::Client.new(:test)
      client.write({"command"=>"TEST"})
    end
    server.accept
  end
end
