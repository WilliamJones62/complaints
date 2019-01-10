class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :set_image, only: [:showimage]
  before_action :build_lists, only: [:new, :create, :edit, :update]
  before_action :set_user

  # GET /complaints
  def index
    if @user == 'ADMIN'
      @complaints = Complaint.all
    else
      @complaints = Complaint.where(user: @user)
    end
  end

  # GET /complaints/1
  def show
  end

  def showimage
  end

  def new
    @complaint = Complaint.new
    4.times { @complaint.complaint_images.build }
  end

  # GET /complaints/1/edit
  def edit
    @complaint.complaint_images.build
  end

  # POST /complaints
  def create
    cp = complaint_params
    if $error
      cp[:complaint_images_attributes] = $images
    end
    @complaint = Complaint.new(cp)
    respond_to do |format|
      if @complaint.save
        $error = false
        format.html { redirect_to complaints_url, notice: 'Issue was successfully created.' }
      else
        $error = true
        $images = cp[:complaint_images_attributes]
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /complaints/1
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to complaints_url, notice: 'Issue was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /complaints/1
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: 'Issue was successfully deleted.' }
    end
  end

  def import
    Complaint.import(params[:file])
    redirect_to root_url, notice: "Issue list imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def set_image
      @complaint_image = ComplaintImage.find(params[:id])
      @complaint = Complaint.find(@complaint_image.complaint_id)
    end

    def set_user
      @user = current_user.email.upcase
    end

    def build_lists
      @issue = ['BUTCHERING/HANDLING','SHELF LIFE/AGE', 'LOOSE/BLOWN BAG', 'PRODUCT CONSISTENCY', 'FOREIGN MATERIAL']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(
        :user, :invoice, :part, :part_count, :issue_date, :issue, :issue2, :issue3, :issue4, :issue5, :notes,
        complaint_images_attributes: [
          :id,
          :image
        ]
      )
    end
end
