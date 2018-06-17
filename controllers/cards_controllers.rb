class CardController <Sinatra::Base
  # Enable reloader
  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{ File.join(root, "views")}

  # Index
  get '/cards' do
    @cpost = Card.all
    erb :"cards/index"
  end

  # New
  get '/cards/new' do
    @cpost = Card.new
    erb :"cards/new"
  end
  # show
  get '/cards/:id' do
    id = params[:id].to_i
    @cpost = Card.find(id)
    erb :'cards/show'
  end
  # create
  post '/cards/' do
    post = Card.new
    post.title = params[:title]
    post.body = params[:body]
    post.save
    redirect "/cards"
  end
  # edit
  get '/cards/:id/edit' do
    id = params[:id].to_i
    @cpost = Card.find(id)
    erb :"cards/edit"
  end
  # Update
  put "/cards/:id" do
    id = params[:id].to_i
    post = Card.find(id)
    post.title = params[:title]
    post.body = params[:body]
    post.save
    redirect "/cards/#{id}"
  end
  # Destory
  delete "/cards/:id" do
    id = params[:id].to_i
    Card.destroy(id)
    redirect "/cards"
  end
end
