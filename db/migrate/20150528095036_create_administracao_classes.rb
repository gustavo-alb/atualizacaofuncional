class CreateAdministracaoClasses < ActiveRecord::Migration
  def change
    create_table :administracao_classes do |t|
      t.string :nome
      t.string :codigo

      t.timestamps null: false
    end
  end
end
