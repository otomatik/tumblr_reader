require 'open-uri'
module TumblrReader

	class Client
		attr_accessor :tumblr_url

		def initialize url
			@tumblr_url = follow url
		end

		def get_article url
			TumblrReader::Article.new open("#{clean_url url}/xml").read
		end

		def get_random_article
			get_article follow "#{self.tumblr_url}/random"
		end

		def follow url
			final_uri = ''
			open(clean_url url) { |h| final_uri = h.base_uri.to_s }
			clean_url final_uri
		end

		def clean_url url
			url.sub(/(\/)?(#_=_)?$/,'')
		end
	end
end