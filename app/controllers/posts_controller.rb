class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    group = Group.find_by(id: params[:group_id])
    @post = group.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to group_post_path(group, @post), notice:"New Post Created"
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :visable)
  end
end
