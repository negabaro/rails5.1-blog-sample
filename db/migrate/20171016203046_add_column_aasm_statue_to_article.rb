class AddColumnAasmStatueToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :aasm_state, :string
    
  end
end
