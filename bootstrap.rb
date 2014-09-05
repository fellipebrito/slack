require 'dotenv' unless ENV['RACK_ENV'] == 'production'
require 'yaml'

# Settings
Dotenv.load unless ENV['RACK_ENV'] == 'production'
settings = YAML.load ERB.new(File.read 'config/settings.yml').result
TEAM    = settings['slack']['team']
TOKEN   = settings['slack']['token']

# Project base dir
base_dir          = File.dirname(__FILE__)
APPLICATION_PATH  = base_dir

# Require scripts
path  = "#{base_dir}/lib/*.rb"
Dir[path].each { |file| require file }
scripts_path  = "#{base_dir}/lib/scripts/*.rb"
Dir[scripts_path].each { |file| require file }
