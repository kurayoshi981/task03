class CreatePercents < ActiveRecord::Migration[5.2]
  def change
    create_table :percents do |t|
      t.integer :value

      t.timestamps
    end
  end
end
