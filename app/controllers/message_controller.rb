class MessageController < ApplicationController

  def select
    store_id = cookies.signed[:user_id]
    @users = User.where.not(id: store_id || {})
    @groups = Group.all
  end

  def user
    @user = User.find_by(id: params[:id])
  end

  def group
    @group = Group.find_by(id: params[:id])
  end

  def create
    request_data = params.require(:message).permit(:from, :to, :content)
    if params[:type] == "user"
      generate_message(request_data[:from], request_data[:to], request_data[:content])
    else
      group_users = Group.find(request_data[:to]).users.each { |user| generate_message(request_data[:from], user.id, request_data[:content]) }
    end
  end

  private

  def generate_message from, to, content
    Message.create(user_from: from, user_to: to, content: content)
  end


end
