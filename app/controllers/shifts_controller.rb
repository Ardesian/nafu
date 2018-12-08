class ShiftsController < ApplicationController

  def new
    @title = "In Queue"
    @hide_footer = true
  end

  def create
  end

  def show
    # Verify correct user is actually in shift
  end

  def index
  end

end
