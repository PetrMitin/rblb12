class CreateAuthomorphs < ActiveRecord::Migration[7.1]
  def change
    create_table :authomorphs do |t|
      t.integer :n
      t.integer :value
      t.integer :square

      t.timestamps
    end
  end
end
