class CreateAdministracaoQuadros < ActiveRecord::Migration
  def change
    create_table :administracao_quadros do |t|
      t.string :nome
      t.string :codigo

      t.timestamps null: false
    end
  end
end
