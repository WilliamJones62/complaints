class EmployeeListsController < ApplicationController
  # GET /employee_lists/1
  def show
  end

  def import
    EmployeeList.import(params[:file])
    redirect_to root_url, notice: "Issue list imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_list_params
      params.require(:employee_list).permit(
        :Employee_Status, :Badge_No, :Cost_Center_Code, :Department, :Lastname, :Firstname, :Employee_Name, :Hire_Date, :Termination_Date
      )
    end
end
