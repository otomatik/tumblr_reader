require 'libxml'
require 'uri'

module TumblrReader

	class Article

		attr_accessor :title, :body, :tags

		def initialize data
			self.parse LibXML::XML::Parser.string data
		end

		def parse xml
			article = xml.parse
			self.title = article.find_first('//regular-title').content
			self.body  = article.find_first('//regular-body').content
			self.tags  = article.find('//tag').to_a.map(&:content)
		end

		def image
			URI.extract(self.body).first # /https?:\/\/[\S]+.gif/
		end
	end
end