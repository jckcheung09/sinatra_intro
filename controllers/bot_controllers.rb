class BotController <Sinatra::Base
  # Enable reloader
  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{ File.join(root, "views")}

  $bposts =[
    {
      id: 0,
      title: "bot post 1",
      body: "Im robot 1 beepboop"
    },
      {
      id: 1,
      title: "bot post 2",
      body: "robots go boom"
      },{
      id: 2,
      title: "bot post 3",
      body: "must rule over humans!!!"
    }
  ]
  # index
  get '/bots' do
    @bpost = $bposts
    erb :'bots/index'
  end
  # New
  get '/bots/new' do
    'this is the new page'
  end
  # show
  get '/bots/:id' do
    id = params[:id].to_i
    @bpost = $bposts[id]
    erb :'bots/show'
  end
  # create
  post '/bots/:id' do
    'this is the create page'
  end
  # edit
  get '/bots/:id/edit' do
    'this is the edit page'
  end
  # Update
  put "/bots/:id" do
    'this is the update page'
  end
  # Destory
  delete "/bots/:id" do
    'this is the destroy page'
  end
end
