require 'bundler'
Bundler.setup

require 'toto'
require 'coderay'
require 'rack/codehighlighter'
require 'rack/rewrite'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger
use Rack::Codehighlighter, 
:coderay, :markdown => true,
:element => "pre>code",
:pattern => /\A:::(\w+)\s*(\n|&#x000A;)/i,
:logging => true

if ENV['RACK_ENV'] == 'production'
	use Rack::Rewrite do
		r301 '/actionscript/flash-video-calcular-el-tamano-del-buffer.html', '/2008/10/28/flash-video-calcular-el-tamao-del-buffer/'
	end  
	
end

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
  
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,    "Yëco"                               # blog author
  # set :title,     Dir.pwd.split('/').last                   # site title
  # set :root,      "index"                                   # page to load on /
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

  set :author, "Yëco"
  set :date, lambda {|now| now.strftime("%d %b %Y") }
  set :summary, :max => 1000, :delim => /~\n/
  set :disqus, 'elbleg'
  set :title, 'elBleg'
  # set :url, 'http://elbleg.com'

 end

run toto


