class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :content
      t.string :brick

      t.timestamps
    end
  end
end
