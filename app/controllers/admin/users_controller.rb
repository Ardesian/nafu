class ::Admin::UsersController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Employees" }

  def index
    @users = User.order(created_at: :desc)
  end

  def new
    @user = User.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, @user]
    else
      render :form
    end
  end

  def update
    if @user.update(user_params)
      @user.avatar.attach(params.dig(:user, :avatar))
      redirect_to [:admin, @user]
    else
      render :form
    end
  end

  private

  def setup
    @user = User.find(params[:id]) if params[:id].present?
  end

  def user_params
    params.require(:user).permit(
      :fname,
      :mname,
      :lname,
      :phone,
      :role,
      :email,
      notes: [
        :author_id,
        :body
      ]
    )
  end
end
