require 'libxml'
require 'uri'

module TumblrReader

	class Article

		attr_accessor :title, :body, :tags, :links

		def initialize data
			self.parse LibXML::XML::Parser.string data
		end

		def parse xml
			article = xml.parse
			self.title = article.find_first('//regular-title').content
			self.body  = article.find_first('//regular-body').content
			self.tags  = article.find('//tag').to_a.map(&:content)
			self.links = URI.extract(self.body)
		end

		def images
			self.links.select { |link| link.match(/.png|jpg|gif$/) }
		end
	end
end