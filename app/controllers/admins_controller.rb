class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :correct_admin, only: [:edit, :update, :destroy]
  before_action :super_admin, except: [:show, :edit, :update, :destroy]


  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, flash: {success: 'Admin was successfully created.'} }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, flash: {success: 'Admin was successfully updated.'} }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, flash: {success: 'Admin was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :super_admin)
    end

    def super_admin
      unless current_admin.super_admin
        redirect_to new_admin_session_path
        flash[:error] = "You're not authorized!"
      end
    end

    def correct_admin
      unless current_admin.super_admin or @admin == current_admin
        redirect_to new_admin_session_path
        flash[:error] = "You're not authorized!"
      end
    end
end
