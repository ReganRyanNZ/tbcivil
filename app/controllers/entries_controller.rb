class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry ||= Entry.new

    gon.push({
      project_codes: current_project_codes
    })
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      # redirect_to @entry, notice: "Entry successfully saved."
      redirect_to root_path, notice: "Entry successfully saved."
    else
      flash.now[:alert] = "Your entry could not be saved: #{@entry.errors.full_messages.join(", ")}."
      render :new
    end
  end

  private

  def current_project_codes
    project_codes = {}
    current_user.team.projects.each { |project|
      project_codes[project.id] = project.project_codes.map { |code| [code.name, code.id] }.sort_by { |code| code[0] }
    }
  end

  def entry_params
    params.require(:entry).permit(
      :user_id,
      :started_at,
      :finished_at,
      :break_minutes,
      :weather,
      project_entries_attributes: [
        :id,
        :_destroy,
        :project_id,
        :project_code_id,
        :site_condition,
        :location,
        :activity_description,
        :hours_worked,
        project_entry_machines_attributes: [
          :id,
          :_destroy,
          :machine_id,
          :start_hours,
          :finish_hours
        ],
        project_entry_materials_attributes: [
          :id,
          :_destroy,
          :material_id,
          :quantity,
          :truck_size
        ]
      ]
    )
  end
end