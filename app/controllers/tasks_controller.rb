class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(params[:id])
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to '#'
    else
      render 'new'
    end
  end
  
  def index
    @tasks = Task.all
  end
  
end
