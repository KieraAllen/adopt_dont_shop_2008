class AddAdoptionStatusToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :status, :string, default: "adoptable"
  end
end
