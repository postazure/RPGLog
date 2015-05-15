class PlayerController < ApplicationController
  def new
    group = Group.find_by(id: params[:group_id])
    @player = group.players.new()

  end

  def create
    invite_id = params[:invite_id].keys.first
    invite = GroupInvite.find_by(id: invite_id)

    @character = current_user.players.new(player_params)
    @character.group_id = params[:group_id]
    if @character.save
      invite.destroy
      redirect_to group_path(params[:group_id]), notice: "Character Created Succesfully"
    else
      render :new
    end
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  private
  def player_params
    params.require(:player).permit(
      :name,
      :race,
      :money,
      :exp,
      :level,
      :gender,
      :game_class
    )
  end
end
