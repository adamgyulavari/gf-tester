class HomeController < ApplicationController
  def index
    @users = User.order('running_tests DESC').all
  end

  def result
    CreateResultJob.perform_later(current_user)
    current_user.update(last_runned: nil)
    redirect_to root_path
  end

  def console
    raise 'f'
  end
end
