class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.string :name
    end
  end
end
