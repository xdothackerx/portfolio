class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tech
      t.string :description

      t.timestamps
    end
  end
end
