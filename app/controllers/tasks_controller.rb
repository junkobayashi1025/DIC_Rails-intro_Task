class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "新しいWhisperを登録しました"
      else
        render :new
      end
    end
  end
  # def create
  #   task = Task.new(task_params)
  #   task.save
  #   redirect_to tasks_url, notice: "新しいWhisperを登録しました"
  # end
  def show
    @task = Task.find(params[:id])
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    task =Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: 'Whisperを更新しました'
  end
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: 'Whisperを削除しました'
  end
  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end

  private
  def task_params
    params.require(:task).permit(:content)
  end
end
