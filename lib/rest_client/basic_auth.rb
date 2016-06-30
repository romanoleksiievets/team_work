module RestClient
  class BasicAuth
    attr_reader :resource, :errors, :response, :name

    def initialize(id)
      @errors = []
      @integration ||= Integration.find(id)
      @resource ||= RestClient::Resource.new(@integration.url, headers: headers)
      @name = @integration.name.titleize
    end


    def get(url)
      rescue_errors do
        @response = resource[url].get
        JSON.parse(@response) if @response.present?
      end
    end

    def post(url, data = {})
      rescue_errors do
        @response = resource[url].post(data.try(:to_json))
        JSON.parse(@response) if @response.present?
      end
    end

  private
    def rescue_errors
      yield
    rescue => e
      @response = e.try(:response)
      headers = @response.try(:headers)
      @errors <<
        case e.message
        when /getaddrinfo/
          "Can't connect to #{@name} by url: #{@url}"
        when "401 Unauthorized", "403 Forbidden"
          "Can't connect to #{@name} with provided credentials."
        else
          "#{e.message} #{headers.try(:[], :x_seraph_loginreason)} #{headers.try(:[], :x_authentication_denied_reason)}"
        end
      false
    end

    def headers
      { accept: :json, content_type: :json, Authorization: "#{@integration.auth_type.to_s.humanize} #{@integration.auth_token}" }
    end
  end
end
