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

		def get_random_article
			redirection = Net::HTTP.get_response(URI.parse("#{self.tumblr_url}/random"))
			get_article redirection['location'][0..-5]
		end
	end
end