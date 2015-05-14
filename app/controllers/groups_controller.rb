class GroupsController < ApplicationController
  require "pp"

  def index
    characters = Character.where(user_id: current_user.id)

    @groups = {}
    @groups[:player] = characters.map {|character| character.group}
    @groups[:owner] = Group.where(owner_id: current_user.id)
  end
end
