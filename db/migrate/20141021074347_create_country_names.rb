class CreateCountryNames < ActiveRecord::Migration
  def change
    create_table :country_names do |t|
      t.string :jp
      t.string :en

      t.timestamps
    end
  end
end
