class UserController < ApplicationController

  def login
    store_id = cookies.signed[:user_id]
    if store_id
      redirect_to login_in_user_url(store_id)  
    else
      @users = User.all
    end
  end

  def login_in
    cookies.signed[:user_id] = params[:id]
    redirect_to select_message_index_url
  end


end
