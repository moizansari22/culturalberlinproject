class RenameSecondtypeToWebsourceInEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :secondtype, :websource
  end
end
