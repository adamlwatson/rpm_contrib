require 'new_relic/control/ruby'
# This is the framework control object for Goliath apps.
# It is loaded by virtue of detecting 'goliath' as the framework
# in the rpm_contrib/detection/goliath.rb file.  It gets loaded
# by the new_relic/control.rb file.
class NewRelic::Control #:nodoc:
  class Goliath < NewRelic::Control::Ruby
    def init_config(options)
      super
      @local_env.dispatcher = 'goliath'
      self['app_name'] ||= 'Goliath Application'
    end
  end
end
