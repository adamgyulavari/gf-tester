class UsersController < ApplicationController
  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:solution_file, :test_file)
  end
end
