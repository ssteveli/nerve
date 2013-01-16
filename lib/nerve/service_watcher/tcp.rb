module Nerve
  module ServiceCheck
    require 'socket'
    
    class TcpServiceCheck
      def initialize(opts={})
        raise ArgumentError unless opts['port']
        @port = opts['port']
        @host = opts['host'] ? opts['host'] : '0.0.0.0'
      end

      def check?
        # catch all errors
        begin
          # TODO(mkr): add a timeout
          socket = TCPSocket.new(@host,@port)
          socket.close
        rescue
          # TODO(mkr): add a good output message
          return false
        end
        return true
      end
    end
  end
end
