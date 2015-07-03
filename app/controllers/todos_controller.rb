class TodosController < ApplicationController

  before_action :require_user

  def index
    @todos = Todo.where user_id = @current_user.id
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = @current_user.id
    @todo.save!

    redirect_to '/'
  end

  private
  def todo_params
    params.require(:todo).permit(:content)
  end
end
