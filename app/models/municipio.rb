class Municipio < ActiveRecord::Base
	has_many :funcionarios
	has_many :locais,class_name: "Administracao::Local"
end
