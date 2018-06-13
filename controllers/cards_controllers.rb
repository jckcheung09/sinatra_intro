class CardController <Sinatra::Base
  # Enable reloader
  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{ File.join(root, "views")}

  $cposts =[
    {
      id: 0,
      title: "card post 1",
      body: "this is my first card post, so great"
    },
      {
      id: 1,
      title: "card post 2",
      body: "this is my 2nd card post"
      },{
      id: 2,
      title: "card post 3",
      body: "this is my 3nd post"
    }
  ]

  # Index
  get '/cards' do
    @cposts = $cposts
    erb :"cards/index"
  end

  # New
  get '/cards/new' do
    'this is the new page'
  end
  # show
  get '/cards/:id' do
    id = params[:id].to_i
    @cposts = $cposts[id]
    erb :'cards/show'
  end
  # create
  post '/cards/:id' do
    'this is the create page'
  end
  # edit
  get '/cards/:id/edit' do
    'this is the edit page'
  end
  # Update
  put "/cards/:id" do
    'this is the update page'
  end
  # Destory
  delete "/cards/:id" do
    'this is the destroy page'
  end
end
