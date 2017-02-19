require_relative 'vote_parser'
require_relative 'vote_creator'

class VoteImporter

  attr_accessor :parser, :creator

  def initialize(parser = VoteParser.new, creator = VoteCreator.new)
    @parser = parser
    @creator = creator
  end

  def read_file_and_add_votes(filename)
    vote_data = File.read(Rails.root.join('lib', 'importing', 'data', filename)).to_s
    vote_data.each_line { |line| p line }
    # vote_data.each_line { |line| check_valid_and_process(line) }
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
    vote_time = fields[0]
    campaign_name = fields[1]
    validity = fields[2]
    candidate_name = fields[3]

    campaign = @creator.create_campaign(campaign_name)
    p campaign
    # p @creator.create_candidate(candidate_name, campaign.id)
    # @creator.create_vote(vote_time, campaign.id, candidate.id, validity)
  end

end
