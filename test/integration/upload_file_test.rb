require 'test_helper'
require 'app'

describe 'Upload file' do
  include Rack::Test::Methods

  def app
    API::App
  end

  it 'uploads a file' do
    file_path = fixtures_path 'zip.zip'

    post '/files', {
        file:{
            title: 'My first zip file',
            file: Rack::Test::UploadedFile.new(file_path, 'application/zip', true)
        }
    }

    last_response.status.must_equal 201
  end
end