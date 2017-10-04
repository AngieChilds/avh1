class CompUsersController < ApplicationController
  before_action :set_comp_user, only: [:show, :edit, :update, :destroy]

  # GET /comp_users
  # GET /comp_users.json
  def index
    @comp_users = CompUser.all
  end

  # GET /comp_users/1
  # GET /comp_users/1.json
  def show
  end

  # GET /comp_users/new
  def new
    @comp_user = CompUser.new
  end

  # GET /comp_users/1/edit
  def edit
  end

  # POST /comp_users
  # POST /comp_users.json
  def create
    @comp_user = CompUser.new(comp_user_params)

    respond_to do |format|
      if @comp_user.save
        format.html { redirect_to @comp_user, notice: 'Comp user was successfully created.' }
        format.json { render :show, status: :created, location: @comp_user }
      else
        format.html { render :new }
        format.json { render json: @comp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comp_users/1
  # PATCH/PUT /comp_users/1.json
  def update
    respond_to do |format|
      if @comp_user.update(comp_user_params)
        format.html { redirect_to @comp_user, notice: 'Comp user was successfully updated.' }
        format.json { render :show, status: :ok, location: @comp_user }
      else
        format.html { render :edit }
        format.json { render json: @comp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comp_users/1
  # DELETE /comp_users/1.json
  def destroy
    @comp_user.destroy
    respond_to do |format|
      format.html { redirect_to comp_users_url, notice: 'Comp user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp_user
      @comp_user = CompUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comp_user_params
      params.require(:comp_user).permit(:comp_id, :user_id)
    end
end
