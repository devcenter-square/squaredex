class ChangeSlackUsernameToNickname < ActiveRecord::Migration
  def change
    rename_column :users, :slack_username, :nickname
  end
end
