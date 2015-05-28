class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nome
      t.string :sigla
      t.string :cep

      t.timestamps null: false
    end
  end
end
