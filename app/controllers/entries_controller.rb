class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry ||= Entry.new
  end
end