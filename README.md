# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

# Lets Fork and Clone our Repo

Make sure to fork the payments exercise and that it pops up locally in a github repo. Next in your terminal navigate to where this exercise will live and clone the repo. We also want to setup our remote branch to track what we have done. We should set that up as well.

1. Clone the repo
```bash
  $ git clone https://github.com/your_github_name/payments_exercise.git
```
2. lets cd into the payments exercise
```bash
  $ cd payments_exercise
```

# Getting Rails Started

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
