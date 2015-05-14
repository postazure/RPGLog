class GroupInvitesController < ApplicationController
  def new
    @invite = GroupInvite.new
    group_name = Group.find_by(id: params[:group_id]).name

    @default_msg =  "Hello, I am inviting you to #{group_name}.\n"+
                    "Please click the link and create a character."
  end

  def create
    recipient = User.find_by(email: params[:recipient])

    if recipient
      user_id = recipient.id
    end

    @invite = GroupInvite.new({
      message: params[:group_invite][:message],
      group_id: params[:group_id],
      user_id: user_id,
    })

    if @invite.save
      redirect_to group_path(params[:group_id]), notice: "Invite Sent"
    else
      render :new
    end
  end

  def show
    @invite = GroupInvite.find_by(id: params[:id])
  end

end
