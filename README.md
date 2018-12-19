# Day 38:
## Johnny Carson’s Customer Tracker
### Goal
To reinforce an understanding of Active Record databases.
### Learning Objectives
By the end of this exercise the student will be able to:
- import a existing data into a database.
- run queries on that data.
- generate CSVs.
- extend that database.
### Introduction
“Johnny Carson’s Discount Car Zone and Used Car Lot” contracted you to come up with a solution for their data problem. They're fairly technical so you decided to recommend using Active Record using the ruby cli.

They’ve been tracking customers on a shared spreadsheet and it’s becoming cumbersome as they have hundreds of customers. They supplied you a csv file of their existing data and expect it to be in the new system.
### Setup
- `bundle`
- If you run `bundle exec ruby databse.rb`, you'll notice you arrive at a pry prompt. Use this to test the logic you defined in your file.
### Instructions
Firstly you should import the existing data into the database you’ll be using. Take a look at the csv file and take note of what tables and  columns you’ll need. It’s always important to be aware of what data you’re working with take the time to experiment on how you can import and work with the CSV data.
- Importing data from csv to a ruby program: http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html
- The aim is to translate that data into active record objects, these objects will in turn be saved to our database in relevant tables.
- First off you should think of each row in the supplied CSV as a transaction in their business. - You can see two distinct types of data in each row: a customer and a car. You should create two models for this:
  - Customers: first_name, last_name, email, gender, and phone_number.
  - Cars: model, make, cost_price, sale_markup.
- Now that you've successfully modeled that, you need to think about what constitutes a transaction. It has one customer and has one car. Create a new model called transaction that has the appropriate relations between cars and customers. Transaction should also have a method that outputs the final sale price - this outputs the cost price + markup (the sale_markup is a percentage) + 8.8% sale tax on that result.
- The final product should read in the CSV and allow you to:
  - continually add new records( Customer, Car and Transaction) via the command line prompt.
  - allow you to destroy records via the command line.
  - allow you to query individual transactions.
### Bonus
- Last minute change! The carsons need the ability to add notes on a customer. This means you'll be adding a column to hold this new information! Google it.
### Completion Requirements
- Complete Workshop by end of allotted time limit.
- The completed program:
  - Allows crud operations on three models.
  - Has a method on the transaction model.
  - Populates the database with the supplied csv file on the first run.
- Group review session with the instructor.




