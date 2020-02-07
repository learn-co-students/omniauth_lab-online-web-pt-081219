class SessionsController < ApplicationController
  # This is required because of a quirk the "developer" authentication
  # strategy. We'll remove this when we move to a "real" provider.
  skip_before_action :verify_authenticity_token, only: :create

  def create

    if auth_hash[:provider] == 'github'
      @user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
    else
      @user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = @user.id
    end

    # Ye olde redirect
    redirect_to root_path
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
