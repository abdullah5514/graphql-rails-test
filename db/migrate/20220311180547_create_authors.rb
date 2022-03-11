class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :sur_name
      t.string :birth_year

      t.timestamps
    end
  end
end
