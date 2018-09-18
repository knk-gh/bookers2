class AddProfileIntroToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_intro, :text
  end
end
