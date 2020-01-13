class CreateInvitems < ActiveRecord::Migration[5.1]
  def change
    create_table :invitems do |t|
      t.string :invoice_numb
      t.string :order_numb
      t.string :part_code
      t.string :lot

      t.timestamps
    end
  end
end
