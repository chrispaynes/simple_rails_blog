class PostsController < ApplicationController
  # returns a list of all posts in descending order
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
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
