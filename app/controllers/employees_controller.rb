class EmployeesController < ApplicationController
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  def tax
    @employee = Employee.find(params[:id])
    total_salary, tax_amount, cess_amount = @employee.calculate_tax

    render json: {
      employee_code: @employee.employee_id,
      first_name: @employee.first_name,
      last_name: @employee.last_name,
      yearly_salary: total_salary,
      tax_amount: tax_amount,
      cess_amount: cess_amount
    }
  end

  private

  def employee_params
    params.require(:employee).permit(:employee_id, :first_name, :last_name, :email, :doj, :salary, phone_numbers: [])
  end
end
