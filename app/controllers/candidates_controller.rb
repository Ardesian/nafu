class CandidatesController < ApplicationController
  before_action { @hide_footer = true }

  def new
    @title = "Apply"
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.create(candidate_params)

    if @candidate.persisted?
      redirect_to new_user_session_path, notice: "Thank you. Your application will be reviewed and we will be in touch."
    else
      flash.now[:alert] = "Failed to submit application. Please look over for errors and try again."
      render :new
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(
      :password,
      :fname,
      :mname,
      :lname,
      :email,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :cell_phone,
      :home_phone,
      :citizen,
      :felony,
      :education,
      :references
    )
  end

end
