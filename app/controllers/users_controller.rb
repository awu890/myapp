class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end
def show
  @user = User.find(params[:id])
  if user_signed_in?
      @planga = Planga.new({
        :public_api_id => Rails.configuration.planga[:public_id],
        :private_api_key => Rails.configuration.planga[:secret_key],
        :conversation_id => "private-#{[current_user.id, @user.id].sort.join("-")}",
        :current_user_id => current_user.id,
        :current_user_name => current_user.full_name,
        :container_id => "chat"
      })
    end
end
def become
    sign_in(:user, User.find(params[:id]))
    redirect_to "/"
  end
end
