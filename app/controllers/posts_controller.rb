class PostsController < ApplicationController
  # returns a list of all posts in descending order
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render "edit"
    end
  end

  # finds a post based on its :id
  def show
    @post = Post.find(params[:id])
  end

  # specifies which params to allow when creating a new post 
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
