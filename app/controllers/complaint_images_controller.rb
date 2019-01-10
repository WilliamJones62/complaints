class ComplaintImagesController < ApplicationController
  before_action :set_complaint
  before_action :set_complaint_image, except: [:new, :create]

  def new
    @complaint_image = ComplaintImage.new
  end

  def edit
  end

  def create
    @complaint_image = ComplaintImage.new(complaint_image_params)
    @complaint_image.save
    render action: 'show', status: :created, location:@complaint
  end

  def update
    @complaint_image.update(complaint_image_params)
  end

  def destroy
    @complaint_image.destroy
    redirect_to @complaint
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:complaint_id])
    end
    def set_complaint_image
      @complaint_image = ComplaintImage.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_image_params
      params.require(:complaint_image).permit(:complaint_id, :image)
    end
end
