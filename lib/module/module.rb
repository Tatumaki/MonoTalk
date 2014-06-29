require 'json'
require "socket"
require 'mono/consts'

#Server / Client共通の処理・インターフェイスを定義する
module Mono
  module Module
    @@local_ip = nil
    def define_local(ip)
      @@local_ip = ip
    end

    def check_local(ip)
      return ip unless @@local_ip
      return "127.0.0.1" if ip == @@local_ip
      return ip
    end
  end
  
  extend Module
end
