class AddProtocolsToEmail < ActiveRecord::Migration[5.1]
  def change
    add_reference :emails, :imaps, index: true
    add_foreign_key :emails, :imaps
    add_reference :emails, :smtps, index: true
    add_foreign_key :emails, :smtps

  end
end
