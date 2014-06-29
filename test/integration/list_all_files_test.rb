require 'test_helper'
require 'uploaders/asset'
require 'models/asset'
require 'app'

describe 'Listening all files' do
  include Rack::Test::Methods

  def app
    API::App
  end

  before do
    get '/files'
  end

  it 'provides a valid response' do
    last_response.status.must_equal 200
  end

  it 'lists all files' do
    last_response.body.must_include 'My first zip file'
  end
end