module API
  class App < Grape::API
    resource :files do
      post do #/files
        params[:file].delete :file
        asset = Asset.new params[:file]
        asset.save

        asset.inspect
      end
    end
  end
end