require_relative 'vote_parser', 'vote_creator'

class VoteImporter

  def initialize
    @parser = VoteParser.new
    @creator = VoteCreator.new
  end

  def read_file_and_add_votes(filename)
    vote_data = File.read(Rails.root.join('lib', 'importing', 'data', filename)).to_s
    vote_data.each_line { |line| add_vote(line) }
  end

  def check_valid_and_process(line)
    if @parser.check_valid(line) == false
      p "Invalid line: #{line}"
    else
      line = @parser.check_valid(line)
      fields = @parser.parse_vote(line)
      seed_database_from(fields)
    end
  end

  def seed_database_from(fields)
    [vote_time, campaign_name, validity, candidate_name].each_with_index do |field, n|
      field = fields[n]
    end
      campaign = @creator.create_campaign(campaign_name)
      candidate = @creator.create_candidate(candidate_name, campaign.id)
      @creator.create_vote(vote_time, candidate, validity)
  end

end
