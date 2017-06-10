class CreateImaps < ActiveRecord::Migration[5.1]
  def change
    create_table :imaps do |t|
      t.string :endereco
      t.string :porta
      t.string :autenticacao
      t.boolean :enable_ssl

      t.timestamps
    end
  end
end
