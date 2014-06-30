 require 'test_helper'
 require 'env'
 require 'apps/v2public'
 require 'uploaders/asset'
 require 'models/asset'

 describe 'Downloading the file as another user' do
   include Rack::Test::Methods

   def app
     API::AppV2Public
   end

   let(:id) { Asset.last.id }
   let(:path) { "/v2/files/#{id}/download" }

   it 'downloads as another user' do
     file_path = fixtures_path 'zip.zip'
     asset = Asset.new({title: 'My first zip file',
                        receiver: "afurm@softserveinc.com",
                        file: Rack::Test::UploadedFile.new(file_path, 'application/zip', true)})
     asset.save

     get path, receiver: "afurm@softserveinc.com"

     last_response.status.must_equal 302
   end

   it 'fails to download the file as the incorrect user' do
     get path, receiver: "example@mail.com"

     last_response.status.must_equal 403 #Forbidden
   end
 end