class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.references :message, foreign_key: true
      t.integer :reader_id

      t.timestamps
    end
  end
end
