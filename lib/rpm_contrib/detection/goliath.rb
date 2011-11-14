module NewRelic #:nodoc:
  # The class defined in the
  # newrelic_rpm[http://newrelic.github.com/rpm] which can be amended
  # to support new frameworks by defining modules in this namespace.
  class LocalEnvironment #:nodoc:
    module Goliath
      def discover_framework
        if defined?(::Goliath)
          puts "framework is goliath"
          @framework = 'ruby'
        else
          super
        end
      end
      def discover_dispatcher
        super
        if defined?(::Goliath) && @dispatcher.nil?
          @dispatcher = 'goliath'
        end
      end
    end
  end
end
