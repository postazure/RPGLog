class GroupsController < ApplicationController
  def index
    players = current_user.players

    @groups = {}
    @groups[:player] = players.map {|player| player.group}
    @groups[:owner] = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    group = current_user.groups.new(group_params)

    if group.save
      redirect_to group, notice: 'Group was created'
    else
      render :new
    end
  end

  def edit
    @group = Group.find_by(id: params[:id])
  end

  def update
    group = Group.find_by(id: params[:id])

    if group.update(group_params)
      redirect_to group, notice: 'Group was updated'
    else
      redirect_to edit_group_path(group)
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @group_owner = User.find_by(id: @group.user_id)
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
