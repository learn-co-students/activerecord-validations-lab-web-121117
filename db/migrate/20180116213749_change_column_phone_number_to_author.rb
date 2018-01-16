class ChangeColumnPhoneNumberToAuthor < ActiveRecord::Migration
  def change
    change_column :authors, :phone_number, :string
  end
end
