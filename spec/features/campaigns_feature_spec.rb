require 'rails_helper'

describe 'feature tests' do

  feature 'on index page' do

    context 'when no campaigns have been added' do
      scenario 'it should tell you there are no campaigns' do
        visit '/'
        expect(page).to have_content 'No campaigns listed yet. Seed the database!'
      end
    end

    context 'when one campaign has been added' do
      scenario 'it should show you the name of the campaign' do
        create_vote1
        visit '/'
        expect(page).to have_link 'test_campaign1'
      end
    end

    context 'when two campaigns have been added' do
      scenario 'it should show you the campaigns in alphanumerical order' do
        create_vote1
        create_vote2
        visit '/'
        expect(page.body).to match(/test_campaign1.*test_campaign2.*/m)
      end
    end

  end

  feature 'on campaigns page' do

    before do
      create_vote1
      create_vote3
      create_vote4
      create_vote5
      create_vote6
      create_invalid_vote_pre
      create_invalid_vote_post
      visit '/'
      click_link 'test_campaign1'
    end

    scenario 'you should be redirected to the correct campaign path and see the results' do
      expect(current_path).to eq "/campaigns/#{Campaign.first.id}"
      expect(page).to have_content 'test_campaign1'
      expect(page).to have_content 'campaign'
      expect(page).to have_content 'Valid Votes'
      expect(page).to have_content 'Invalid votes cast'
    end

    scenario 'you should see the candidate and valid vote count' do
      candidate_name = page.find(:css, 'tr.candidate_row:nth-of-type(2) > td.candidate_name')
      expect(candidate_name).to have_content 'candidate1'
      vote_count = page.find(:css, 'tr.candidate_row:nth-of-type(2) > td.vote_count')
      expect(vote_count).to have_content '1'
    end

    scenario 'candidates should be listed in order of valid vote count' do
      expect(page.body).to match(/candidate3.*candidate1.*/m)
    end

    scenario 'pre and post votes should show up as invalid' do
      expect(page.find(:css, 'th#invalid_vote_count').text).to eq("2")
    end

    scenario 'you should be able to return home' do
      click_link('<< Home')
      expect(current_path).to eq '/'
    end
  end
end
