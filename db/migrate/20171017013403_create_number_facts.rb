class CreateNumberFacts < ActiveRecord::Migration[5.1]
  def change
    create_table :number_facts do |t|
      t.string :choice
      t.integer :fun_number
      t.integer :fun_year
      t.date :fun_date

      t.timestamps
    end
  end
end
