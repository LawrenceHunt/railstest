# GAGEVOTE: The future of SMS Democracy is here!

**An SMS Vote Counting System for mGage, by Lawrence Hunt**

## Installation Instructions

To check out the app on your local server:

* Install Rails and Postgresql
* Unzip the files to your hard drive
* run `bundle install`
* run `rake db:create` to create your databases
* run `rake db:migrate` to migrate your databases
* run `rake db:seed` to **seed** your database with the lib/seeds/votes.txt file provided in the task description, using the code in db/seeds.rb
* run `bin/rails s` to run the server
* open your browser and go to http://localhost:3000 to view app
* run `rspec` to check tests are all passing

## Using the site
* Click a campaign to see the results, filtered by candidate.
* Click `<< Home` to go back to index page.

## Overview of Approach and Design Decisions

Create vote model
Create campaign model
Create candidate model

Create seed_votes task

## TESTING FRAMEWORK: Rspec with Capybara

TDD was used throughout.

## DATABASE

I used postgresql, a database which I'm familiar with from Makers Academy.

## MODELS

#### Campaign
-

#### Candidate

#### Vote
- has epoch time integer, with tested validation - as this was not mentioned in the list of fields irrelevent to the exercise - but this currently does not feature in either the UI or controller logic, as per instructions.
- has validity - validated for presence in model, but the seed logic deals with actual values of 'during', 'pre' and 'post'.
- has candidate_id
Associations
- belongs to Campaign
- belongs to Candidate



Generating the Campaign model

Generating the Candidate model

Generating the Vote model
`bin/rails g model vote time:integer campaign:references candidate:references`


### Reading from Seed Data

I placed the Votes.txt file in /lib/seeds.

I used a regular expression to define the exact format of a vote line, as follows:
`/^VOTE\s(.+)\sCampaign:(.+)\sValidity:(.+)\sChoice:(.+)\sCONN:.+\sMSISDN:.+\sGUID:.+\sShortcode:.+\n/`

Each value is contained within a capture group - so that if other attributes such as _CONN_ and _Shortcode_ are needed at a later date, we can repeat the process with the second parameter swapped out for higher numbers.

I then

### Challenges/Improvements

Dealing with non-UTF-8 characters:

Despite the code I used in seeds.rb functioning well in the console, I couldn't

Validations: presumably in a real-world situation we'd want to validate the campaign names in each vote against a list of existing campaign names, to guard against any entered in error.

Should candidates names persist between campaigns for continuous data analysis? Should we come up with a way to tell duplicates apart?
