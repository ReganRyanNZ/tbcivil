class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry ||= Entry.new
    @user = current_user
    @project_entry_machine = ProjectEntryMachine.new
  end
end