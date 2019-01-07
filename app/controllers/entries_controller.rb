class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry ||= Entry.new
    @user = current_user
    @project_entry_machine = ProjectEntryMachine.new
  end

  private

  def entry_params
    params.require(:entry).permit(
      :started_at,
      :finished_at,
      :break_minutes,
      project_entry_attributes: [
        :id,
        :_destroy,
        :project_id,
        :weather,
        :site_condition,
        :location,
        :activity_description,
        :hours_worked,
        machine_project_entry_attributes: [
          :id,
          :_destroy,
          :machine_id,
          :start_hours,
          :finish_hours
        ]
      ]
    )
  end
end