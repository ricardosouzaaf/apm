class AddCpftToClient < ActiveRecord::Migration
  def change
    add_column :clients, :cpf, :string
  end
end
