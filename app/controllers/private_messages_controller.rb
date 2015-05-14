class PrivateMessagesController < ApplicationController
  def index
    @messages = current_user.private_messages
  end

  def show
    @message = PrivateMessage.find(params[:id])
    @sender = User.find_by(id: @message.from_user)
  end

  def new
    @message = PrivateMessage.new
  end

  def create
    @message = PrivateMessage.new(message_params)

    recipient = User.find_by(email: params[:recipient])

    if recipient
      @message.errors.add(:user_id, "Recipient account not found.")
      @message.user_id = recipient.id
    else
      @message.from_user = current_user.id
    end


    p "@"*20
    pp @message.errors
    p "@"*20

    if @message.save
      redirect_to private_messages_path, notice: "Message sent"
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:private_message).permit(:subject, :body)
  end
end