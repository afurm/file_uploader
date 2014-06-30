module API
  class AppV2Public < Grape::API
    version :v2, using: :path

    resources :files do
      get '/:id/download' do
        file = Asset[params[:id]]
        if file.can_be_downloaded_with? params[:receiver]
          path = file.file_url.gsub("public/","")
          redirect path
        else
          error! "You're not allowed to download this file.", 403
        end
      end
    end
  end
end