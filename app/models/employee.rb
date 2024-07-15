class Employee < ApplicationRecord

  validates :employee_id, presence: true, uniqueness: true
  validates :first_name, :last_name, :email, :doj, :salary, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :valid_phone_numbers

  def calculate_tax
    EmployeeTaxCalculator.new(self).calculate
  end
  
  private

  def valid_phone_numbers
    if phone_numbers.empty? || !phone_numbers.all? { |number| number =~ /\A\d{10}\z/ }
      errors.add(:phone_numbers, "must contain valid 10-digit phone numbers")
    end
  end
end
