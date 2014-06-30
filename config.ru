 $:.unshift File.expand_path '..', __FILE__

 require 'lib/env'

 require 'lib/apps/v2'
 require 'lib/uploaders/asset'
 require 'lib/models/asset'
 require 'lib/models/user'

 use Rack::Static,
     urls: ['/uploads'],
     root: 'public'

 run API::AppV2