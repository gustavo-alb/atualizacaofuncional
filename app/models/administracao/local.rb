module Administracao
class Local < ActiveRecord::Base
	belongs_to :local_pai,class_name: "Local"
	belongs_to :municipio
	enum tipo: [:setorial,:secretaria,:escola]
end
end