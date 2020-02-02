#require File.expand_path('../config/environment', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
#Bundler.require(*Rails.groups)
#module Backend
#  class Application < Rails::Application
#    # Initialize configuration defaults for originally generated Rails version.
#    config.load_defaults 6.0
#  end
#end
#

class Handler
  def run(body, headers)
    status_code = 200 # Optional status code, defaults to 200
    response_headers = {"content-type" => "text/plain"}
    body = "Welcome to Rails, the embedded string is #{"".blank? ? 'blank' : 'not blank'}."

    return body, response_headers, status_code
  end
end
