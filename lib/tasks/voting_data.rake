require_relative '../importing/vote_importer'

namespace :voting_data do
  desc "Import votes from lib/importing/data"
  task import: :environment do

    importer = VoteImporter.new
    importer.read_file_and_add_votes('votes.txt')
  end
end
