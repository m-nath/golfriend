class ChangeDefaultToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :photo, "https://res.cloudinary.com/dxouryvao/image/upload/v1566012205/birdie.png"
  end
end
