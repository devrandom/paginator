# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/paginator.rb'

#, Paginator::VERSION) do |p|
Hoe.spec('paginator') do
  self.rubyforge_name = 'paginator'
  self.summary = 'A generic paginator object for use in any Ruby program'
  self.description =<<EOD
Paginator doesn't make any assumptions as to how data is retrieved; you just
have to provide it with the total number of objects and a way to pull a specific
set of objects based on the offset and number of objects per page.  
EOD
  self.url = "http://paginator.rubyforge.org"
  self.changes = paragraphs_of('History.txt', 0..1).join("\n\n")
  self.email = %q{bruce@codefluency.com}
  self.author = ["Bruce Williams"]
  self.readme_file = "README.rdoc"
end

# vim: syntax=Ruby
