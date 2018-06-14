require 'sinatra'
require "sinatra/contrib"
require "sinatra/reloader" if development?
require_relative "controllers/posts_controllers.rb"
require_relative "controllers/cards_controllers.rb"
require_relative "controllers/bot_controllers.rb"
use Rack::Reloader
use Rack::MethodOverride
run PostsController
use CardController
use BotController
