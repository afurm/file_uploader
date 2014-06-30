require 'test_helper'
require 'uploaders/asset'
require 'models/asset'
require 'app'

describe 'Upload file' do
  include Rack::Test::Methods

  def app
    API::App
  end

  before do
    file_path = fixtures_path 'zip.zip'

    post '/files', {
        file:{
            title: 'My first zip file',
            file: Rack::Test::UploadedFile.new(file_path, 'application/zip', true)
        }
    }
  end

  it 'uploads a file' do
    last_response.status.must_equal 201
  end

  it 'retrieves the content for the new file' do
    last_response.body.must_include 'My first zip file'

  end

  it 'retrieves the actual filename' do
    last_response.body.must_include 'zip.zip'
  end

  it 'retrieves the full path of the file' do
    last_response.body.must_include 'public/uploads/assets'
  end
end