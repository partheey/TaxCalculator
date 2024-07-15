# TaxCalculator

TaxCalculator is a Ruby on Rails application designed to manage employee details and calculate tax deductions based on predefined rules.

## Features

- Create employee records with mandatory fields.
- Validate employee data and return errors on invalid data.
- Calculate and return tax deductions for employees based on their yearly salary and date of joining.

## Requirements

- Ruby 3.2
- Rails 7.1
- PostgreSQL

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/EmployeeApp.git
    cd EmployeeApp
    ```

2. Install dependencies:

    ```bash
    bundle install
    ```

3. Set up the database:

    ```bash
    rails db:create
    rails db:migrate
    ```

## Usage

1. Start the Rails server:

    ```bash
    rails server
    ```

2. Use the following endpoints to interact with the application:

    - **Create Employee**

      ```http
      POST /employees
      ```

      Request Body:

      ```json
      {
        "employee": {
          "employee_id": "EMP001",
          "first_name": "John",
          "last_name": "Doe",
          "email": "john.doe@example.com",
          "phone_numbers": ["1234567890"],
          "doj": "2023-05-16",
          "salary": 50000
        }
      }
      ```

    - **Get Tax Deduction**

      ```http
      GET /employees/:id/tax
      ```

      Response Body:

      ```json
      {
        "employee_code": "EMP001",
        "first_name": "John",
        "last_name": "Doe",
        "yearly_salary": 550000,
        "tax_amount": 37500,
        "cess_amount": 0
      }
      ```

## Testing

To run tests, use the Rspec testing framework:

1. Create a test database and run migrations:

    ```bash
    rails db:create RAILS_ENV=test
    rails db:migrate RAILS_ENV=test
    ```

2. Run tests:

    ```bash
    bundle exec rspec
    ```