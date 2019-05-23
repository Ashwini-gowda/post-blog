class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order("created_at DESC").paginate(page: params[:page], per_page: 3)
    #@posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
      #flash[:success] = "updated successfully"
      #redirect_to @post
    else
      render 'edit'
    end
  end

  def show
     @post.increase_visit
  end

  def destroy
    #@post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice: "Post deleted successfully."
    else
      redirect_to @post, alert: "Error: #{ @post.errors.full_messages.join(', ')}"
    end
    #respond_to do |show|
      #show.html { redirect_to @posts }
    #end
  end 

  protected
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :author, :media) 
    end
end
