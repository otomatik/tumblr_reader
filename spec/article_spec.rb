require 'spec_helper'

describe TumblrReader::Article do
	
	let(:data) do
		"""
		<tumblr>
			<posts>
				<post>
					<regular-title>Title</regular-title>
					<regular-body>&lt;a href=\"http://thomas.dalo.us/\"/&gt; &lt;img src=\"http://url.com/image.gif\"/&gt;</regular-body>
					<tag>tagA</tag>
					<tag>tagB</tag>
				</post>
			</posts>
		</tumblr>
		"""
	end

	let(:gif_url) { "http://url.com/image.gif" }

	describe "article initialization" do
		subject { TumblrReader::Article.new data }
		
		it { expect(subject.title).to eq "Title" }
		it { expect(subject.links).to eq ["http://thomas.dalo.us/", gif_url] }
		it { expect(subject.images).to eq [gif_url] }
		it { expect(subject.tags).to eq ["tagA", "tagB"] }
	end

end