class CommandsController < ApplicationController
  def index
    @robot = Robot.create
  end

  def create
    command = Command.new(command_params[:command], robot)

    if command.execute
      @robot = command.robot
      render :index
    else
      head 400
    end
  end

  private

  def robot
    Robot[command_params[:robot_id]]
  end

  def command_params
    params.permit(:command, :robot_id)
  end
end
