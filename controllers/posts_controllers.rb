class PostsController <Sinatra::Base
  # Enable reloader
  configure :development do
    register Sinatra::Reloader
  end
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{ File.join(root, "views")}

  $posts =[
    {
      id: 0,
      title: "post 1",
      body: "this is my first post, so great"
    },
      {
      id: 1,
      title: "post 2",
      body: "this is my 2nd post"
      },{
      id: 2,
      title: "post 3",
      body: "this is my 3nd post"
    }
  ]

  # Index
  get '/' do

    # "<h1>this is the main page</h1> <h3><a href="/posts"> Go to posts</a></h3> "
    ' <h1>Main page</h1> <h3><a href="/cards"> Go to cards</a> </h3> <h3><a href="/posts"> Go to posts</a></h3> <h3><a href="/bots"> Go to bots</a></h3>'
  end

  #post Index
  get '/posts' do
    # @title = "Blog Posts"

    @posts = $posts
    erb :"posts/index"
  end
  # New
  get '/posts/new' do

    erb :"posts/new"
  end
  # create
  post '/posts/:id' do
    "Create"
    puts params
  end
  # show
  get '/posts/:id' do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/show'
  end
  # edit
  get "/posts/:id/edit"do

  end

  # Update
  put "/posts/:id" do

  end
  # Destroy
  delete "/posts/:id"do

  end
end
