class InitialMigration < ActiveRecord::Migration


  def change
    create_table :gamers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_registered

      t.timestamps
    end


    create_table :items do |t|
      t.integer :gamer_id
      t.string :name
      t.string :item_type
      t.text :comments

      t.timestamps
    end

    create_table :consoles do |t|
      t.string :name
      t.string :medium
      t.string :manufacturer

      t.timestamps
    end

    create_table :consoles_gamers do |t|
      t.integer :gamer_id
      t.integer :console_id

      t.integer :number_owned
      t.integer :number_controllers
      t.text    :comments

      t.timestamps
    end


  end
end
