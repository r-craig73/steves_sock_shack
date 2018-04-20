class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :review_id, :integer
      t.column :cost, :money
      t.column :country_of_origin, :string
      t.column :featured, :boolean

      t.timestamps
    end
  end
end
