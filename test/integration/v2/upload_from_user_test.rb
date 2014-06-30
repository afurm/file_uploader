require 'test_helper'
require 'uploaders/asset'
require 'models/asset'
require 'apps/v2'

describe 'Upload file' do
  include Rack::Test::Methods

  def app
    API::AppV2
  end

  describe 'when authorize' do
    before do
      file_path = fixtures_path 'zip.zip'

      authorize 'afurm', 'password'

      post '/v2/files', {
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

    it 'references to user' do
      last_response.body.must_include 'afurm'
    end
  end

  describe 'when not authorize' do
    it 'fails if no authentication' do
      post '/v2/files'

      last_response.status.must_equal 401
    end
  end
end