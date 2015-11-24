class GoalsController < ApplicationController
  before_action :user_owns_goal, only: [:edit, :update, :destroy]

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.save
    flash.now[:errors] = @goal.errors.full_messages
    redirect_to user_url(current_user)
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_url(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_url(@goal.user_id)
  end

  private
  def goal_params
    params.require(:goal).permit(:body, :private)
  end

  def user_owns_goal
    @goal = current_user.goals.find(params[:id])
    unless @goal
      flash[:errors] = ["This goal is not for you!"]
      redirect_to user_url(current_user)
    end
  end
end
