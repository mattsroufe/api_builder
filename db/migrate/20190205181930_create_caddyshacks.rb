class CreateCaddyshacks < ActiveRecord::Migration[5.2]
  def change
    create_table :caddyshacks do |t|
      t.string :hello
      t.string :world

      t.timestamps
    end
  end
end
