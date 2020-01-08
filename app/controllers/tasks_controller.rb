class TasksController < ApplicationController
  before_action :set_user
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]


  def index
    @tasks = @user.tasks
  end

  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url(@user, @task)
    else
      render 'new'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクを更新しました"
      redirect_to user_tasks_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    if @task.save
      flash[:success] = "消しましたよ！"
      redirect_to user_tasks_path
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def task_params
      params.require(:task).permit(:title, :body)
    end
end
