class Importer

  def read_file_and_add_votes(filename)
    vote_data = File.read(Rails.root.join('lib', 'seeding', 'data', filename)).to_s
    vote_data.each_line { |line| add_vote(line) }
  end

  def add_vote(line)
    # line = check_utf8(line)
    # if !line_match_regex?(line)
    #   p "Invalid line: #{line}"
    # else

    if !check_valid(line)
      p "Invalid line: #{line}"
    else
      fields = parse_vote(line)
      [vote_time, campaign_name, validity, candidate_name].each_with_index do |field, n|
        field = fields[n]
      end

      campaign = create_campaign(campaign_name)
      candidate = create_candidate(candidate_name, campaign.id)
      create_vote(vote_time, candidate, validity)
    end
  end

  def check_valid(line)
    if (match_regex?(line))
      check_utf8(line)
    else
      false
    end
  end

  private

  # Matches the format of a voting line from the data
  VOTE_REGEX = /^VOTE\s(.+)\sCampaign:(.+)\sValidity:(.+)\sChoice:(.+)\sCONN:.+\sMSISDN:.+\sGUID:.+\sShortcode:.+\n/

  # Deletes any non-UTF-8 characters in the line
  def check_utf8(line)
    line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  end
  # Checks line follows the general formula defined by the REGEX
  def match_regex?(line)
    line.match(VOTE_REGEX)
  end

  # Parses the vote line and returns an array with the relevant fields
  def parse_vote(line)
    line += "\n"
    vote_time = line.gsub(VOTE_REGEX, '\1')
    campaign_name = line.gsub(VOTE_REGEX, '\2')
    validity = line.gsub(VOTE_REGEX, '\3')
    candidate_name = line.gsub(VOTE_REGEX, '\4')
    [vote_time, campaign_name, validity, candidate_name]
  end

  def create_campaign(campaign_name)
    Campaign.where(name: campaign_name).first_or_create
  end

  def create_candidate(candidate_name, campaign)
    Candidate.where(name: candidate_name, campaign_id: campaign.id).first_or_create
  end

  def create_vote(vote_time, campaign, candidate, validity)
    vote = Vote.new
    vote.time = vote_time
    vote.campaign = campaign
    vote.candidate = candidate
    vote.validity = validity

    if(vote.save)
      p "vote saved - time: #{vote_time}, campaign:#{campaign_name}, choice: #{candidate_name}"
    else
      p "error, vote not saved..."
    end
  end


  # PREVIOUS CODE TO BE REFACTORED- ALSO IN SEEDS.RB

  #
  # vote_data = File.read(Rails.root.join('lib', 'importing', 'data', 'votes.txt')).to_s
  #
  # vote_data.each_line do |line|
  #
  #   # Guard clause deals with non-UTF-8 characters
  #   line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  #
  #   # Guard clause checks a vote line matches the correct format
  #   if (!line.match(VOTE_REGEX))
  #     p "Invalid vote line!"
  #   else
  #     # Regex parses out attributes
  #     vote_time = line.gsub(VOTE_REGEX, '\1')
  #     campaign_name = line.gsub(VOTE_REGEX, '\2')
  #     validity = line.gsub(VOTE_REGEX, '\3')
  #     candidate_name = line.gsub(VOTE_REGEX, '\4')
  #
  #     vote = Vote.new
  #     campaign = Campaign.where(name: campaign_name).first_or_create
  #     candidate = Candidate.where(name: candidate_name, campaign_id: campaign.id).first_or_create
  #
  #     vote.time = vote_time
  #     vote.campaign = campaign
  #     vote.candidate = candidate
  #     vote.validity = validity
  #
  #     if(vote.save)
  #       p "vote saved - time: #{vote_time}, campaign:#{campaign_name}, choice: #{candidate_name}"
  #     else
  #       p "error, vote not saved..."
  #     end
  #   end
  # end

end
