class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string      :description
      t.datetime    :due
      t.boolean     :complete

      t.timestamps  null: false
    end
  end
end
