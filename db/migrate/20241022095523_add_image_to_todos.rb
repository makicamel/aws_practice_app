class AddImageToTodos < ActiveRecord::Migration[7.1]
  def change
    add_column :todos, :image, :string, null: true, default: nil, after: :description
  end
end
