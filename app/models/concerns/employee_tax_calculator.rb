class EmployeeTaxCalculator
  def initialize(employee)
    @employee = employee
  end

  def calculate
    total_salary, tax_amount, cess_amount = calculate_tax

    {
      employee_code: @employee.employee_id,
      first_name: @employee.first_name,
      last_name: @employee.last_name,
      yearly_salary: total_salary,
      tax_amount: tax_amount,
      cess_amount: cess_amount
    }
  end

  private

  def calculate_tax
    current_date = Date.today
    start_date = Date.new(current_date.year, 4, 1)
    end_date = Date.new(current_date.year + 1, 3, 31)

    if @employee.doj > end_date
      total_salary = 0
    elsif @employee.doj > start_date
      loss_of_pay_days = (@employee.doj - start_date).to_i
      total_salary = (@employee.salary * 12) - (@employee.salary / 30 * loss_of_pay_days)
    else
      total_salary = @employee.salary * 12
    end

    tax_amount = calculate_tax_amount(total_salary)
    cess_amount = (total_salary > 2500000) ? (total_salary - 2500000) * 0.02 : 0

    [total_salary, tax_amount, cess_amount]
  end

  def calculate_tax_amount(salary)
    tax = 0

    if salary > 1000000
      tax += (salary - 1000000) * 0.2
      salary = 1000000
    end

    if salary > 500000
      tax += (salary - 500000) * 0.1
      salary = 500000
    end

    if salary > 250000
      tax += (salary - 250000) * 0.05
    end

    tax
  end
end
