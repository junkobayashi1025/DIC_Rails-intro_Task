class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_url, notice: "新しいWhisperを登録しました"
  end

  private
  def task_params
    params.require(:task).permit(:content)
  end
end
