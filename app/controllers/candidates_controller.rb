class CandidatesController < ApplicationController
  before_action { @hide_footer = true }

  def new
    @title = "Apply"
  end

end
