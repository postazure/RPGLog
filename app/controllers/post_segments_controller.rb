class PostSegmentsController < ApplicationController
  def new
    @post = Post.find_by(id: params[:post_id])
    @post_segment = @post.post_segments.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @post_segment = @post.post_segments.new(segment_params)
    @post_segment.user_id = current_user.id

    if @post_segment.save
      redirect_to group_post_path(@post.group, @post), notice: "Story Segment Saved"
    else
      render :new
    end
  end

  def edit
    @post_segment = PostSegment.find_by(id: params[:id])
    @post = @post_segment.post
  end

  def update
    @post_segment = PostSegment.find_by(id: params[:id])
    @post = @post_segment.post
    if @post_segment.update(segment_params)
      redirect_to group_post_path(@post.group, @post), notice: "Story Segment Updated"
    else
      render :edit
    end
  end

  def destroy
    @post_segment = PostSegment.find_by(id: params[:id])
    @post_segment.destroy
    post = @post_segment.post
    redirect_to group_post_path(post.group, post), notice: "Segment has been deleted"
  end

  private
  def segment_params
    params.require(:post_segment).permit(:subject, :body, :visable, :image)
  end
end
