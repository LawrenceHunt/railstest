class AddValidityToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :validity, :string
  end
end
