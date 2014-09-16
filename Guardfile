guard :rspec, cmd: "bundle exec rspec" do
	
	watch(%r{^lib/tumblr_reader/(.+).rb$}) do |m|
		"spec/#{m[1]}_spec.rb"
	end

	watch(%r{^spec/(.+).rb$}) do |m|
		"spec/#{m[1]}.rb"
	end
end