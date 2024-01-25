class AddFieldsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author, :string
    add_column :books, :cost, :decimal
    add_column :books, :publication_date, :date
  end
end
