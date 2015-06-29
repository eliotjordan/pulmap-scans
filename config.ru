# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# If RAILS_RELATIVE_URL_ROOT is set, map to url
if ENV['RAILS_RELATIVE_URL_ROOT']
  map ENV['RAILS_RELATIVE_URL_ROOT'] do
    run Rails.application
  end
else
  run Rails.application
end
