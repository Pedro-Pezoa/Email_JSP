class CreateSmtps < ActiveRecord::Migration[5.1]
  def change
    create_table :smtps do |t|
      t.string :endereco
      t.string :porta
      t.string :autenticacao
      t.boolean :enable_starttls_auto

      t.timestamps
    end
  end
end
