class TasksController < ApplicationController
  before_action :set_user

  def index
    @tasks = @user.tasks
  end

  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(params[:task])
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_task_url(@user, @task)
    else
      render 'new'
    end
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
end
