class AddAuthorToBug < ActiveRecord::Migration[6.0]
  def change
    add_reference :bugs, :author, foreign_key: true
  end
end
