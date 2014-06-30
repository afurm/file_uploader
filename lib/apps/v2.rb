module API
  class App < Grape::API
    version :v2, using: :path

    use Rack::Config do |env|
      env['api.tilt.root'] = File.join Dir.pwd, 'lib/views'
    end

    default_format :json
    formatter :json, Grape::Formatter::Rabl

    resource :files do
      get '/', rabl: 'assets/collection' do
        @assets = Asset.all
      end

      post '/', rabl: 'assets/item' do
        @asset = Asset.new params[:file]
        @asset.save
      end
    end

    resource :users do
      post '/', rabl: 'users/item' do
        @user = User.new params[:user]
        @user.save
      end
    end
  end
end