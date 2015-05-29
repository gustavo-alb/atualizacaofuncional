class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :cpf
      t.string :cadastro
      t.string :componente_curricular
      t.string :documento_movimentacao
      t.integer :carga_horaria_id
      t.integer :classe_id
      t.integer :ambiente_id
      t.integer :cargo_id
      t.integer :turmas
      t.integer :ch_em_sala
      t.integer :lotacao_id
      t.integer :quadro_id
      t.integer :concurso_id
      t.integer :municipio_opcao_id
      t.integer :situacao_id
      t.integer :usuario_id
      t.integer :disciplina_concurso_id
      t.integer :disciplina_atuacao_id

      t.timestamps null: false
    end
  end
end
