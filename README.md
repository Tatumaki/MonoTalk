# MonoTalk

MonoTalk is one of a simple way to use TCP server and client.  
モノトークはTCPでサーバー・クライアント通信をする簡単な方法を提供します。  
  
Nothing complicated, and nothing disturb.  
複雑な事や妨げる何かもありません。  
  
MonoTalk does not provide any compatibility between version and version.  
モノトークはバージョン間の互換性を一切提供しません。  
  
It is because of evolution and development.  
それは進化と発展のためです。  
  
Please note that MonoTalk is not for enterprise.  
注意して欲しいのは、モノトークは事業向けではないということです。  
  
Reconsider if you've installed MonoTalk rashly.  
もしよく理解せずに導入してしまったのなら、再検討をおすすめします。  
  
  
    if you.are.confirmed? then  
        `gem install mono_talk`
    end  
  
  
  
## Installation

Add this line to your application's Gemfile:

    gem 'mono_talk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mono_talk


## 紹介  

面倒くさいので日本語で書きます、海外の方ごめんなさい。  
謝る程のユーザーはいないと思うので気にしません。  
  
モノトークの設計思想はすごく単純です。  
1. なるべく手間が少ないこと  
2. 環境の移動に柔軟なこと  
3. 拡張性があること  

  
MonoTalkはまだ実績も無ければ経験もないため、設計そのものが安定していません。  
  
* セキュリティなにそれ美味しいの？  
* Strong Parametersに憑かれた
* ＼(^o^)／

な設計仕様ですが、本人は割と真面目に使い勝手の向上を試行錯誤してます。  
しばらくは色々なものへの導入はおすすめしませんし、  
しばらく経ってもおすすめしません。  
  


## 使い方 / How to use

### ./mono_talk/config.rb

    module Mono  
      PORT = {   
        test: 8000  
      }  
      
      HOST = {   
        test: "127.0.0.1"   
      }  
    end  
    

### test.rb  

    require 'mono_talk'  
      
    server = MonoTalk::Server.new(:test,MonoTalk::SAMPLE_ROUTINE)  
      
    thread = Thread.new do  
      client = MonoTalk::Client.new(:test)  
      client.write({"command"=>"TEST"})  
    end   
      
    server.accept  # > Test succeed.



何やら絵文字が使われてますが、ふざけてるわけではありません。直せないだけです。てかなんですかねこれ？

