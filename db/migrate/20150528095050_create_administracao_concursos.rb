class CreateAdministracaoConcursos < ActiveRecord::Migration
  def change
    create_table :administracao_concursos do |t|
      t.string :nome
      t.string :codigo

      t.timestamps null: false
    end
  end
end
