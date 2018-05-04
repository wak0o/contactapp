class AddContactToTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :tags, :contact, foreign_key: true
  end
end
