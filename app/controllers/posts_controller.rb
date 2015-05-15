class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    group = Group.find_by(id: params[:group_id])
    @post = group.posts.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to group_post_path(group, @post), notice:"Post saved"
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @post_segments = @post.post_segments.order(created_at: :asc)
    toggle_post_segment_visable if params[:visable]
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to group_post_path(@post.group, @post), notice:"Post updated"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to @post.group, notice:"Post deleted"

  end

  private
  def post_params
    params.require(:post).permit(:title, :visable)
  end

  def toggle_post_segment_visable
    segment = PostSegment.find_by(id: params[:segment])
    segment.update_attribute(:visable, params[:visable])
  end
end
