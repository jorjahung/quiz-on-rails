class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :Integer
  end
end
