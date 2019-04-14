# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

# Lets Fork and Clone our Repo

Make sure to fork the payments exercise and that it pops up locally in a github repo. Next in your terminal navigate to where this exercise will live and clone the repo. We also want to setup our remote branch to track what we have done as we complete this exercise. We should set that up as well.

1. Clone the repo
```bash
  $ git clone https://github.com/your_github_name/payments_exercise.git
```
2. lets cd into the payments exercise
```bash
  $ cd payments_exercise
```
3. Initialize git and setup our remote branch for version control!
```bash
  $ git init
  $ git remote add origin https://github.com/your_github_name/payments_exercise.git
```
4. Initial commit! You should have some red text displaying on your terminal when you run "git status". Go ahead and "git add ." all of those things. Next we commit and push!
```bash
  $ git status
  $ git add .
  $ git commit -m "initial commit"
  $ git push -u origin master
```


# Getting Rails Started and Setting Up The Environment

First we need to setup our environment and make sure all our assets, gemfiles, test cases etc are all working.

1. Bundle install all the things!
```bash
  $ bundle install
```
2. lets setup our database
```bash
  $ rake db:migrate
  $ rake db:seed
```
3. lets boot up our rails server on localhost 3000.  
```bash
  $ rails s
```
After you run the command in terminal go ahead and on your web browser (internet) check to make sure the common rails landing page is working.
http://localhost:3000/

Cool, the landing page is up and we are being welcomed to rails. Lets make sure that the test cases that came with this forked repo light up green.

4. In your terminal go ahead run the test cases with the following command.
```bash
  $ bundle exec rspec
```
Boom! Green is a good sign and we can confidently start the next stage of this exercise.

# Check Our "Loans" Endpoint

Before we start coding anything we should see what our database looks like and interpret those model"s" accordingly. Take a look at the schema, navigate to "payments_exercise/db/schema.rb"

It should have a Loan table already in there, let's check one more thing. In our localhost landing page go ahead and type /loans on the end of the browser string. It should look like this..
http://localhost:3000/loans

What we are looking at is a json response of the data that is being persisted from our backend in json format. Looks like we are ready to start this exercise.
