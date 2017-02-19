# GAGEVOTE: The future of SMS Democracy is here!

**An SMS Vote Counting System for mGage, by Lawrence Hunt**

## Installation Instructions

To check out the app on your local server:

* Install Rails and Postgresql
* Unzip the files to your hard drive
* cd to the root of the folder (gageVote/)
* run `bundle install`
* run `rake db:create` to create your databases
* run `rake db:migrate` to migrate your databases
* run `rake voting_data:import` to import the supplied data
* run `bin/rails s` to run the server
* open your browser and go to http://localhost:3000 to view app
* run `rspec` to check tests are all passing

## Using the site
* Click a campaign to see the results, filtered by candidate.
* Click `<< Home` to go back to index page.

## Overview of Approach

* TDD USED THROUGHOUT: I used Rspec with Capybara.
* DATABASE: I used postgresql, a database I'm familiar with from Makers Academy.
* SOLID principles followed as far as possible.

### MODELS

Campaign
========
- has name

Candidate
========
- has name and campaign_id
- belongs to Campaign

Vote
====
- has epoch time integer - though this is not actually used yet in either the interface or business logic.
- validity - validated for presence in model, but the seed logic deals with actual values of 'during', 'pre' and 'post'.
- has candidate_id
- belongs to Campaign
- belongs to Candidate

### Reading from Seed Data

I placed the Votes.txt file in lib/importing/data.
I've set up a rake task to add it into the database. You can easily modify it to choose a different txt file.
The logic is spread between 3 classes, which are filed in lib/importing.

I followed this approach:

**VoteImporter** reads the file, and sends each line to **VoteParser**.
This is where a regular expression defines the exact format of a vote line, as follows:
`/^VOTE\s(.+)\sCampaign:(.+)\sValidity:(.+)\sChoice:(.+)\sCONN:.+\sMSISDN:.+\sGUID:.+\sShortcode:.+\n/`
**VoteParser** first checks the validity of the line and returns it to **VoteImporter** with any non-UTF-8 characters filtered out.
Then it comes back to **VoteParser** to filter out the individual fields using the same regex, which are then sent to **VoteCreator** to instantiate the models in the database.

I've set this up so that a new campaign entry is only created if it doesn't already exist - candidates are created if they aren't duplicated within the same campaign.

### Challenges

Unit testing the VoteImporter class - I could not get a test to work for the seed_database_from method in the time I had.
It is the only class with less than 100% test coverage!
However, the functionality for creating elements IS unit tested in vote_creator_spec.rb - so this represents a pretty small gap.

### Potential Next Steps
- A more detailed visual interface to show results - e.g. bar chart

- More sophisticated validations: perhaps in a real-world situation we'd want to validate the campaign names in each vote against a list of pre-defined campaign names, to guard against any entered in error.
