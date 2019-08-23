module Swn::Middleware
  class Overwriter < Grape::Middleware::Base
    def after
      return unless @app_response

      @error_code ||= 0
      @error_message ||= ''

      status, headers = *@app_response
      content = JSON.parse(@app_response.body.first)
      body = {
        content: content,
        error: {
          code: @error_code,
          message: @error_message
        }
      }

      Rack::Response.new([body.to_json], status, headers)
    end
  end
end
