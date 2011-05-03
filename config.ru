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
		r301 '/web-dev/javascript/10-formas-de-escribir-un-mejor-codigo-en-jquery.html', '/2009/08/23/10-formas-de-escribir-un-mejor-cdigo-en-jquery/'
		r301 '/web-dev/javascript/nombres-de-funciones-dinamicos-con-javascript.html', '/2009/10/27/nombres-de-funciones-dinmicos-con-javascript/'
		r301 '/web-dev/snippet-favoritos-recientes-de-delicious-con-php.html', '/2009/11/14/snippet-favoritos-recientes-de-delicious-con-php/'
		r301 '/web-dev/javascript/optimizando-javascript-para-un-rendimiento-extremo-y-bajo-consumo-de-memoria.html', '/2009/11/15/optimizando-javascript-para-un-rendimiento-extremo-y-bajo-consumo-de-memoria/'
		r301 '/bleg/titanium-en-el-tech-camp-costa-rica.html', '/2009/11/17/titanium-en-el-tech-camp-costa-rica/'
		r301 '/web-dev/10-buenas-razones-para-usar-firebug.html', '/2009/12/28/10-buenas-razones-para-usar-firebug/'
		r301 '/opensource/bot-de-twitter-en-una-linea-de-codigo.html', '/2009/12/31/bot-de-twitter-en-una-lnea-de-cdigo/'
		r301 '/web-dev/javascript/twitter-y-las-cabras-asi-funciona-el-exploit.html', '/2010/09/26/twitter-y-las-cabras-as-funciona-el-exploit/'
		r301 '/objective-c/evento-touch-y-animacio%cc%81n-para-juegos-ba%cc%81sica-con-objective-c.html
		', '/2010/08/19/evento-touch-y-animacion-para-juegos-basica-con-objective-c/'
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


