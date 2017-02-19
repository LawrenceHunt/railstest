namespace :voting_data do
  desc "Import votes from lib/importing/data"
  task import: :environment do

    importer = Importer.new
    importer.read_file_and_add_votes(votes.txt)

  end

end
