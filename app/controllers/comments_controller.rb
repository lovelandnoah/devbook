class CommentsController < ApplicationController
	before_action :params_id, only: [:edit, :update, :show]

  def edit
  end

  def new
  	@comment = Comment.new
  end

  def update
  	@post = @comment.post
  	if @comment.update(comment_params)
  		redirect_to post_path(@post)
  	else
  		render :edit
  	end
  end

  def create
  	@comment = Comment.new(comment_params)
  	@post = Post.find(@comment.post_id)
  	if @comment.save
  		redirect_to post_path(@post)
  	else
  		render :new
  	end
	end

	def destroy
		comment = Comment.find(params[:id])
		post = Post.find(comment.post_id)
		if comments.destroy
			redirect_to post_path(post)
		else
			redirect_to comment_path(comment)
		end
	end

	def show
		@post = @comment.post
		@user = @comment.user
	end








  private

	  def params_id
	  	@comment = Comment.find(params[:id])
	  end

	  def comment_params
	  	params.require(:comment).permit(:opinion, :user_id, :post_id)
	  end
end
