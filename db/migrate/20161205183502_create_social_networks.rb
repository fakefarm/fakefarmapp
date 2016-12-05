class CreateSocialNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :social_networks do |t|
      t.string :handle
      t.string :url
      t.string :bio

      t.timestamps
    end
  end
end
