require 'spec_helper'

describe TumblrReader::Client do

	let(:tumblr_url) { 'http://lesjoiesducode.fr' }
	let(:article_url) { 'http://lesjoiesducode.fr/post/97566501525/quand-lappli-passe-tous-les-tests-sans-probleme' }
	
	describe "client initialization" do
		subject { TumblrReader::Client.new "#{tumblr_url}/" }
		it { expect(subject.tumblr_url).to eq tumblr_url }
	end

	describe ".get_article" do
		let(:tumblr_reader_client) { TumblrReader::Client.new tumblr_url }
		subject { tumblr_reader_client.get_article(article_url).title }
		it { should eq "Quand l'appli passe tous les tests sans problème" }
	end

	describe ".get_random_article" do
		let(:tumblr_reader_client) { TumblrReader::Client.new tumblr_url }
		subject { tumblr_reader_client.get_random_article.title }
		it { should_not be_empty }
	end
end