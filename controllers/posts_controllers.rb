class PostsController <Sinatra::Base
  # Enable reloader
  configure :development do
    register Sinatra::Reloader
  end
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')
  # sets the view directory correctly
  set :views, Proc.new{ File.join(root, "views")}

  # Index
  get '/' do

    # "<h1>this is the main page</h1> <h3><a href="/posts"> Go to posts</a></h3> "
    ' <h1>Main page</h1> <h3><a href="/cards"> Go to cards</a> </h3> <h3><a href="/posts"> Go to posts</a></h3> <h3><a href="/bots"> Go to bots</a></h3>'
  end

  #post Index
  get '/posts' do
    # @title = "Blog Posts"

    @posts = Post.all
    erb :"posts/index"
  end
  # New
  get '/posts/new' do
    @post = Post.new
    erb :"posts/new"
  end

  # create
  post '/posts/' do
   post = Post.new
   post.title = params[:title]
   post.body = params[:body]
   post.save
   redirect "/posts"
  end

  # show
  get '/posts/:id' do
    id = params[:id].to_i
    @post = Post.find(id)
    erb :'posts/show'
  end
  # edit
  get "/posts/:id/edit"do
  id = params[:id].to_i
  @post = Post.find(id)
  erb :"posts/edit"
  end

  # Update
  put "/posts/:id" do
    id = params[:id].to_i
    post = Post.find(id)
    post.title = params[:title]
    post.body = params[:body]
    post.save
    redirect "/posts/#{id}"

  end
  # Destroy
  delete "/posts/:id"do
      id = params[:id].to_i
      Post.destroy(id)
      redirect "/posts"
  end
end
