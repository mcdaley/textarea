#------------------------------------------------------------------------------
# app/controllers/tasks_controller.rb
#------------------------------------------------------------------------------
class TasksController < ApplicationController
  
  before_action   :authenticate_user!
  
  def index
    logger.debug("[TASKS]: index, params=[#{params.inspect}]")
    
    @user   = current_user
    @tasks  = @user.tasks
    @task   = @user.tasks.new
  end
  
  def new
    logger.debug("[TASKS]: new, params=[#{params.inspect}]")
    
    @user   = current_user
    @task   = @user.tasks.new
  end
  
  def create
    logger.debug("[TASKS]: create, params=[#{params.inspect}]")
    
    if is_cancelled?
      logger.debug  "[TASKS]: user cancelled the request, do NOT create task"
      redirect_to   tasks_path
      return
    end
    
    @user   = current_user
    @task   = @user.tasks.new(task_params)
    
    if @task.save
      logger.info   "[TASKS]: saved tasks, with description= #{@task.description}"
      redirect_to   tasks_path
    else
      logger.error  "[TASKS]: Failed to save the task, errors are #{@task.errors.messages.inspect}"
      render        'new'
    end
  end
  
  #----------------------------------------------------------------------------
  # Private
  #----------------------------------------------------------------------------
  private
  
    ##
    # Strong parameters
    #
    def task_params
      params.require(:task).permit(:description, :due_text, :complete, :user_id)
    end
    
    ##
    # Check to see if user cancelled request
    #
    def is_cancelled?
      return true   if params[:commit] == "cancel"
      return false
    end
  
end # end of class TasksController
