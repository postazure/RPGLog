class CharactersController < ApplicationController
  def new
    group = Group.find_by(id: params[:group_id])
    @character = group.characters.new(group_id: group.id)
  end

  def create
    invite_id = params[:invite_id].keys.first
    invite = GroupInvite.find_by(id: invite_id)

    @character = current_user.characters.new(character_params)
    @character.group_id = params[:group_id]
    if @character.save
      invite.destroy
      redirect_to group_path(params[:group_id]), notice: "Character Created Succesfully"
    else
      render :new
    end
  end

  private
  def character_params
    params.require(:character).permit(
      :name,
      :race,
      :money,
      :exp,
      :level
    )
  end
end
