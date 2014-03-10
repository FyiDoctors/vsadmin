class AddBrowserToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :browser, :string
  end
end
