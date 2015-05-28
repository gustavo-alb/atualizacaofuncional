class CreateAdministracaoCargaHorarias < ActiveRecord::Migration
  def change
    create_table :administracao_carga_horarias do |t|
      t.integer :carga_horaria
      t.string :nome

      t.timestamps null: false
    end
  end
end
