class CreateCrediarios < ActiveRecord::Migration
  def change
    create_table :crediarios do |t|
      t.references :client, index: true, foreign_key: true
      t.decimal :amount
      t.date :emission
      t.date :maturity
      t.string :doc_number
      t.boolean :printed
      t.boolean :status

      t.timestamps null: false
    end
  end
end
