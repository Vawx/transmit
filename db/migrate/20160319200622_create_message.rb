class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :from, :string
      t.column :message, :string

      t.timestamp
    end
  end
end
