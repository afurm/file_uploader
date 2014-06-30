require 'test_helper'
require 'env'
require 'apps/v2'
require 'uploaders/asset'
require 'models/asset'

describe 'Retrieving a single file' do
  include Rack::Test::Methods

  def app
    API::AppV2
  end

  it 'retrieves a file' do
    authorize 'afurm', 'password'
    id = Asset.last.id

    get "/v2/files/#{id}"
    last_response.body.must_include 'My first zip file'
  end

  it 'complains about a bad id' do
    authorize 'afurm', 'password'

    get "/v2/files/zip.zip"
    last_response.status.must_equal 400
  end
end