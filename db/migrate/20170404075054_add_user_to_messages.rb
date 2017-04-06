class AddUserToMessages < ActiveRecord::Migration[5.0]
  def change
    change_table :messages do |t|
      t.belongs_to :user, index: true
    end
  end
end
