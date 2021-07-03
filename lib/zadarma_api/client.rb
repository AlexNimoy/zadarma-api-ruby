# frozen_string_literal: true

require 'digest/md5'
require 'openssl'
require 'base64'
require 'faraday'
require 'faraday_middleware'

module ZadarmaApi
  # ZadarmaApi Client
  class Client
    PROD_URL = 'https://api.zadarma.com'
    SANDBOX_URL = 'https://api-sandbox.zadarma.com'
    API_VERSION = 'v1'

    attr_reader :key, :secret, :api_version, :url

    def initialize(key:, secret:, is_sandbox: false, api_version: API_VERSION)
      @url = is_sandbox ? SANDBOX_URL : PROD_URL
      @key = key
      @secret = secret
      @api_version = api_version
    end

    def call(path, method = 'GET', params = {})
      client.send(method.to_s.downcase, request_path(path), params) do |request|
        request.headers['Accept'] = 'application/json'
        request.headers['Authorization'] = "#{key}:#{signature(path, params)}"
      end
    end

    private

    def signature(path, params)
      query = URI.encode_www_form(params.sort)
      sign_str = request_path(path) + query + Digest::MD5.hexdigest(query)
      Base64.encode64(OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret, sign_str)).strip
    end

    def request_path(path)
      ['/', api_version, path].join
    end

    def client
      @client ||= ::Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.response :json
      end
    end
  end
end
