
DependencyDetection.defer do
  @name = :goliath
  
  depends_on do
    defined?(::Goliath::Request) && !NewRelic::Control.instance['disable_goliath']
  end
  
  executes do
    NewRelic::Agent.logger.debug 'Installing Goliath instrumentation'
  end
  
  executes do
    ::Goliath::Request.class_eval do
      include NewRelic::Agent::MethodTracer
      add_method_tracer :post_process # Traced method: class = Goliath::Request,method = post_process, metric = 'Custom/Goliath::Request/post_process'
    end

  end
end


=begin
module RPMContrib
  module Instrumentation
    # == Instrumentation for Goliath
    module Goliath

      def self.included(mod)
        require 'new_relic/agent/instrumentation/controller_instrumentation'

        (Kernel.const_get(mod.name)::Base).module_eval do
          include NewRelic::Agent::Instrumentation::ControllerInstrumentation
          add_transaction_tracer :response
        end
      end

    end
  end
end

=end