require 'bundler'

Bundler.require
Bundler.require :test

require 'minitest/autorun'

def fixtures_path(file)
  File.expand_path("../fixtures/#{file}", __FILE__)
end

Sequel.connect 'sqlite://db/db.sqlite3'