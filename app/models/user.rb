class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def change
    create_table :contents do |t|
      t.ingeger "id"
      t.string "name"
      t.string "email"

      t.timestamps
    end
  end
end
