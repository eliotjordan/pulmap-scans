# Load the Rails application.
require File.expand_path('../application', __FILE__)

ezid_environment_variables = File.join(Rails.root, 'config', 'ezid_environment_variables.rb')
load(ezid_environment_variables) if File.exists?(ezid_environment_variables)

# Initialize the Rails application.
Rails.application.initialize!
