class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :bio
      t.text :cv
      t.string :email
      t.string :tel
      t.string :image
      t.string :statement

      t.timestamps
    end
  end
end
