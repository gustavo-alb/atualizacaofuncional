module ApplicationHelper
	def objeto_valor(obj)
		if !obj.blank?
			if obj.respond_to?(:nome) and !obj.nome.blank?
				return obj.nome
			elsif obj.respond_to?(:codigo) and !obj.codigo.blank?
				return obj.codigo
			elsif (obj.is_a?(String) or obj.is_a?(Integer)) and !obj.blank?
				return obj
			elsif !obj.blank? and (obj.is_a?(TrueClass))
				return "Sim"
			else
				return "Nada Cadastrado"
			end
		elsif obj.blank? and (obj.is_a?(TrueClass) or obj.is_a?(FalseClass))
			return "Não"
		else
			return "Nada Cadastrado"
		end
	end
end
