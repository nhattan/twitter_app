class BaseUserController < ApplicationController

  before_action :authenticate_user

  private

  def authenticate_user
    render 'layouts/authentication' unless current_user
  end
end
