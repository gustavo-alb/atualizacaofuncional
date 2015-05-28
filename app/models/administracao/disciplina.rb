module Administracao
class Disciplina < ActiveRecord::Base
	has_many :funcionarios
	has_many :funcionarios_atuando,class_name: "Funcionario"
end
end