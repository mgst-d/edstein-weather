class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.datetime :time
      t.float :temperature

      t.timestamps
    end
  end
end
