# class Seeder
#
#   vote_data = File.read(Rails.root.join('lib', 'seeding', 'data', 'votes.txt')).to_s
#
#   VOTE_REGEX = /^VOTE\s(.+)\sCampaign:(.+)\sValidity:(.+)\sChoice:(.+)\sCONN:.+\sMSISDN:.+\sGUID:.+\sShortcode:.+\n/
#
#   vote_data.each_line do |line|
#
#     # Guard clause deals with non-UTF-8 characters
#     line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
#
#     # Guard clause checks a vote line matches the correct format
#     if (!line.match(VOTE_REGEX))
#       p "Invalid vote line!"
#     else
#       # Regex filters out attributes
#       vote_time = line.gsub(VOTE_REGEX, '\1')
#       campaign_name = line.gsub(VOTE_REGEX, '\2')
#       validity = line.gsub(VOTE_REGEX, '\3')
#       candidate_name = line.gsub(VOTE_REGEX, '\4')
#
#       vote = Vote.new
#       campaign = Campaign.where(name: campaign_name).first_or_create
#       candidate = Candidate.where(name: candidate_name, campaign_id: campaign.id).first_or_create
#
#       vote.time = vote_time
#       vote.campaign = campaign
#       vote.candidate = candidate
#       vote.validity = validity
#
#       if(vote.save)
#         p "vote saved - time: #{vote_time}, campaign:#{campaign_name}, choice: #{candidate_name}"
#       else
#         p "error, vote not saved..."
#       end
#     end
#   end
#
# end
