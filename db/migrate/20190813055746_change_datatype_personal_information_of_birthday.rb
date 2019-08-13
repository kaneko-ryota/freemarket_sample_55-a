class ChangeDatatypePersonalInformationOfBirthday < ActiveRecord::Migration[5.0]
  def change
    change_column :personal_informations, :birthday, :date
  end
end
