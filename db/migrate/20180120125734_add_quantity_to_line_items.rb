class AddQuantityToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :quantity, :integer, default: 1
  end
end
# add_XXX_to_TABLE
# remove_XXX_from_TABLE
