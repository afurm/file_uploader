require 'bundler'

Bundler.require
Bundler.require :test

require 'minitest/autorun'

def fixtures_path(file)
  File.expand_path("../fixtures/#{file}", __FILE__)
end

Sequel.connect 'sqlite://db/db.sqlite3'

CarrierWave.configure do |conf|
  conf.root = File.expand_path '../../', __FILE__
  conf.cache_dir = File.expand_path '../../public', __FILE__
end