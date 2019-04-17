class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :loan, foreign_key: true
      t.decimal :payment_amount, precision: 8, scale: 2
      t.datetime :payment_date

      t.timestamps
    end
  end
end
