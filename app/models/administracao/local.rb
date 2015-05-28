module Administracao
class Local < ActiveRecord::Base
	belongs_to :local_pai,class_name: "Local"
	belongs_to :municipio
	has_many :usuarios,:foreign_key=>:lotacao_id
	enum tipo: [:setorial,:secretaria,:escola]
end
end