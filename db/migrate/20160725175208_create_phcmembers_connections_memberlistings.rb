class CreatePhcmembersConnectionsMemberlistings < ActiveRecord::Migration[5.0]
  def change
    create_table :phcmembers_connections_memberlistings do |t|
      t.references :profile, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end