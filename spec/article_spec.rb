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

	let(:article) { TumblrReader::Article.new data }

	describe "retrieve the title of an article" do
		subject { article.title }
		it { should eq "Title" }
	end

	describe "extract all links in an article" do
		subject { article.links }
		it { should eq ["http://thomas.dalo.us/", "http://url.com/image.gif"] }
	end

	describe "extract images links in an article" do
		subject { article.images }
		it { should eq ["http://url.com/image.gif"] }
	end

	describe "aggregate tags of an article" do
		subject { article.tags }
		it { should eq ["tagA", "tagB"] }
	end

end