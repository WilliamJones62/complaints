class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:edit, :update, :show]
  before_action :set_name, only: [:new]
  before_action :set_image, only: [:showimage]
  before_action :build_lists, only: [:new, :create, :edit, :update]

  def new
    @editing = false
    @complaint = Complaint.new
    4.times { @complaint.complaint_images.build }
  end

  def edit
    @complaint.complaint_images.build
  end

  # POST /complaints
  def create
    cp = complaint_params
    if $error && params[:images]
      cp[:complaint_images_attributes] = params[:images]
    end
    if !cp[:lot]
      # need to find lot number
      if cp[:invoice] && cp[:part]
        invitem = Invitem.find_by invoice_numb: cp[:invoice], part_code: cp[:part]
      elsif cp[:order] && cp[:part]
        invitem = Invitem.find_by order_numb: cp[:order], part_code: cp[:part]
        if invitem
          cp[:invoice] = invitem.invoice_numb
        end
      end
      if invitem
        cp[:lot] = invitem.lot
      end
    end
    cp[:status] = 'ACTIVE'
    @complaint = Complaint.new(cp)
    # add an image record if there are none
    if @complaint.complaint_images.length == 0
      @complaint.complaint_images.build
    end
    params[:name] = cp[:user]
    params[:user] = cp[:user]
    $name = params[:name]
    respond_to do |format|
      if @complaint.save
        $error = false
        format.html { redirect_to new_complaint_path, notice: 'Issue was successfully created.' }
      else
        $error = true
        params[:images] = cp[:complaint_images_attributes]
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /complaints/1
  def update
    cp = complaint_params
    if $error && params[:images]
      cp[:complaint_images_attributes] = params[:images]
    end
    if !cp[:lot]
      # need to find lot number
      if cp[:invoice] && cp[:part]
        invitem = Invitem.find_by invoice_numb: cp[:invoice], part_code: cp[:part]
      elsif cp[:order] && cp[:part]
        invitem = Invitem.find_by invoice_numb: cp[:order], part_code: cp[:part]
      end
      if invitem
        cp[:lot] = invitem.lot
      end
    end
    respond_to do |format|
      if @complaint.update(cp)
        $error = false
        format.html { redirect_to complaints_summary_path, notice: 'Issue was successfully updated.' }
      else
        $error = true
        params[:images] = cp[:complaint_images_attributes]
        format.html { render :edit }
      end
    end
  end

  def index
    $users = []
    tempuser = []
    jsuser = []
    employees = EmployeeList.all
    employees.each do |e|
      name = e.Employee_Name.gsub(';', ',')
      tempuser.push(name)
      jsuser.push(e.Employee_Name.gsub(' ', '~'))
    end
    @users = tempuser.sort
    $users = jsuser.sort
  end

  def summary
    @complaints = Complaint.where.not(status: 'COMPLETE')
  end

  def inactive
    @complaints = Complaint.where(status: 'COMPLETE')
  end

  def showimage
  end

  def import
    Complaint.import(params[:file])
    redirect_to root_url, notice: "Issue list imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
      $name = @complaint.user
      @editing = true
    end

    def set_name
      if !params[:name].blank?
        $name = params[:name]
      end
    end

    def set_image
      @complaint_image = ComplaintImage.find(params[:id])
      @complaint = Complaint.find(@complaint_image.complaint_id)
    end

    def build_lists
      @issue = ['BUTCHERING', 'HANDLING - BRUISING', 'SHELF LIFE', 'LOOSE BAG/BLOWN BAG', 'PRODUCT SPEC. (SIZE, TEXTURE, ETC.)', 'FOREIGN MATERIAL', 'TEMPERATURE', 'WRONG ITEM']
      @status = ['ACTIVE','COMPLETE', 'PENDING VEND. RESP.', 'SALES ACTION NEEDED', 'VENDOR ACTION NEEDED', 'WEEKLY SEND TO VENDOR']
      if $parts.blank?
        sort_array = []
        parts = Partmstr.all
        parts.each do |p|
          if p.part_code
            sort_array.push(p.part_code)
          end
        end
        $parts = sort_array.sort
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(
        :user, :invoice, :part, :part_count, :issue_date, :issue, :issue2, :lot, :order, :status, :notes,
        complaint_images_attributes: [
          :id,
          :image
        ]
      )
    end
end
