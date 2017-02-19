class VoteParser

  def parse_vote(line)
    line += "\n"
    vote_time = line.gsub(VOTE_REGEX, '\1')
    campaign_name = line.gsub(VOTE_REGEX, '\2')
    validity = line.gsub(VOTE_REGEX, '\3')
    candidate_name = line.gsub(VOTE_REGEX, '\4')
    [vote_time, campaign_name, validity, candidate_name]
  end

  def check_valid(line)
    line = filter_utf8(line)
    if (match_regex?(line + "\n"))
      return line
    else
      false
    end
  end

  private

  VOTE_REGEX = /^VOTE\s(.+)\sCampaign:(.+)\sValidity:(.+)\sChoice:(.+)\sCONN:.+\sMSISDN:.+\sGUID:.+\sShortcode:.+\n/

  # Deletes any non-UTF-8 characters in the line
  def filter_utf8(line)
    line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  end
  # Checks line follows the general formula defined by the REGEX
  def match_regex?(line)
    line.match(VOTE_REGEX)
  end

end
