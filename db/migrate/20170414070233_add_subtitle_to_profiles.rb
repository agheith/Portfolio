class AddSubtitleToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :subtitle, :string
  end
end
