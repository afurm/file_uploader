module API
  class App < Grape::API
    resource :files do
      post do #/files
        asset = Asset.new params[:file]
        asset.save

        asset.inspect
      end
    end
  end
end