require 'bundler'

Bundler.require
Bundler.require :production

CarrierWave.configure do |conf|
  conf.root = File.expand_path '../../', __FILE__
  conf.cache_dir = File.expand_path '../../public', __FILE__
end