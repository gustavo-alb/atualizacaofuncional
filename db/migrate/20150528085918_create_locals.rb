class CreateLocals < ActiveRecord::Migration
  def change
    create_table :administracao_locais do |t|
      t.string :nome
      t.string :codigo
      t.integer :tipo
      t.integer :local_pai_id
      t.integer :municipio_id

      t.timestamps null: false
    end
  end
end
