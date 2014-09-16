require 'spec_helper'

describe TumblrReader::Article do
	
	let(:data) do
		"""
		<tumblr>
			<posts>
				<post>
					<regular-title>Title</regular-title>
					<regular-body>&lt;img src=\"http://ljdchost.com/f2oTSyF.gif\"/&gt;</regular-body>
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

	describe "extract the image link in an article" do
		subject { article.image }
		it { should eq "http://ljdchost.com/f2oTSyF.gif" }
	end

	describe "aggregate tags of an article" do
		subject { article.tags }
		it { should eq ["tagA", "tagB"] }
	end

end