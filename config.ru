 $:.unshift File.expand_path '..', __FILE__

 require 'lib/env'

 require 'lib/app'
 require 'lib/uploaders/asset'
 require 'lib/models/asset'
 require 'lib/models/user'

 run API::App