module API
  class AppV3 < Grape::API
    version :v3, using: :param

    helpers do
      def log
        AppV3.logger
      end
    end

    before do
      log.warn "Parameters #{params}"
      log.warn "Route info #{route}"
    end

    #root path
    get '/' do
      "Than you!"
    end
  end
end