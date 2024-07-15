# spec/controllers/employees_controller_spec.rb
require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:valid_attributes) {
    {
      employee_id: 'EMP001',
      first_name: 'John',
      last_name: 'Doe',
      email: 'john.doe@example.com',
      phone_numbers: ['1234567890'],
      doj: '2023-05-16',
      salary: 50000
    }
  }

  let(:invalid_attributes) {
    {
      employee_id: '',
      first_name: '',
      last_name: '',
      email: 'invalid_email',
      phone_numbers: ['123'],
      doj: '',
      salary: ''
    }
  }

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Employee" do
        expect {
          post :create, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
      end

      it "returns a created status" do
        post :create, params: { employee: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post :create, params: { employee: invalid_attributes }
        }.to change(Employee, :count).by(0)
      end

      it "returns an unprocessable entity status" do
        post :create, params: { employee: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET #tax" do
    let!(:employee) { create(:employee, doj: Date.new(2023, 5, 16), salary: 50000) }

    it "returns the tax information for the employee" do
      get :tax, params: { id: employee.to_param }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('employee_code')
      expect(response.body).to include('first_name')
      expect(response.body).to include('last_name')
      expect(response.body).to include('yearly_salary')
      expect(response.body).to include('tax_amount')
      expect(response.body).to include('cess_amount')
    end
  end
end
