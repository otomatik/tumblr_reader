require 'net/http'
module TumblrReader

	class Client
		attr_accessor :tumblr_url

		def initialize url
			@tumblr_url = url
		end

		def get_article url
			TumblrReader::Article.new Net::HTTP.get_response(URI.parse("#{url}/xml")).body
		end
	end
end