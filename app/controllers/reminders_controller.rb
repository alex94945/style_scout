class RemindersController < ApplicationController
  before_action :fetch_reminders, except: [:create, :edit, :update]

  def index
  end

  def create
    @reminder = Reminder.create(reminder_params.merge(user_id: current_user.id))
    @reminders = current_user.reminders.paginate(page: params[:page], per_page: 8)
    render :index
  end

  def edit
    @reminder = current_user.reminders.find(params[:id])
  end

  def update
    @reminder = current_user.reminders.find(params[:id])
    @reminder.update(reminder_params)
    @reminders = current_user.reminders.paginate(page: params[:page], per_page: 8)
    render :index
  end

  def destroy
    @reminders.find(params[:id]).destroy
    render :index
  end

  private
    def reminder_params
      params.require(:reminder).permit(:content, :completed)
    end

    def fetch_reminders
      @reminders = current_user.reminders.paginate(page: params[:page], per_page: 5)
    end

end
