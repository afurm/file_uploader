require 'test_helper'
require 'env'
require 'apps/v2'
require 'uploaders/asset'
require 'models/asset'

describe 'Download a file' do
  include Rack::Test::Methods

  def app
    API::AppV2
  end

  it 'downloads a file' do
    authorize 'afurm', 'password'

    asset = Asset.last
    get "/v2/files/#{asset.id}/download"

    last_response.status.must_equal 302
  end
end