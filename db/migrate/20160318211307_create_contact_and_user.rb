class CreateContactAndUser < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :topic, :string
      t.column :info, :string

      t.timestamps
    end
    create_table :users do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password, :string

      t.timestamps
    end
  end
end
