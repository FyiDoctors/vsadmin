class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :content
      t.string :feedback_type
      t.string :email

      t.timestamps
    end
  end
end
