class PostsController < ApplicationController
  def index
  	@posts = Post.all
    @users = User.all
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.find(@post.user_id)
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  		redirect_to post_path(@post)
  	else
  		render :edit
    end
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to posts_path
 	 	else
  		render :new
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if @post.destroy
  		redirect_to posts_path
  	else
  		redirect_to post_path(paths)
  	end
  end

  private

  def post_params
  	params.require(:post).permit(:content, :user_id)
  end
end
