class AddRegistroToClients < ActiveRecord::Migration
  def change
    add_column :clients, :registro_aluno, :string
  end
end
