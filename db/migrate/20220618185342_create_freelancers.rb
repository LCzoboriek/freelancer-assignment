class CreateFreelancers < ActiveRecord::Migration[7.0]
  def change
    create_table :freelancers do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.integer :cost
      t.boolean :featured

      t.timestamps
    end
  end
end
