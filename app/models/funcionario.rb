class Funcionario < ActiveRecord::Base

  scope :do_quadro, ->(quadro) { where(:quadro_id => quadro) }
  scope :do_cargo, ->(cargo) { where(:cargo_id => cargo) }
  belongs_to :lotacao,class_name: "Administracao::Local"
  belongs_to :usuario
  belongs_to :ambiente,class_name: "Administracao::Ambiente"
  belongs_to :situacao,class_name: "Administracao::Situacao"
  belongs_to :concurso,class_name: "Administracao::Concurso"
  belongs_to :classe,class_name: "Administracao::Classe"
  belongs_to :cargo,class_name: "Administracao::Cargo"
  belongs_to :quadro,class_name: "Administracao::Quadro"
  belongs_to :carga_horaria,class_name: "Administracao::CargaHoraria"
  belongs_to :disciplina_concurso,:class_name=>"Administracao::Disciplina",:inverse_of=>:funcionarios
  belongs_to :disciplina_atuacao,:class_name=>"Administracao::Disciplina",:inverse_of=>:funcionarios_atuando
  belongs_to :municipio_opcao,:class_name=>"Municipio"
  validate :validar_local
  validates_presence_of :nome,:cpf,:cargo,:carga_horaria,:quadro,message: "Informação necessária"
  validates_presence_of :classe_id,:municipio_opcao_id,:situacao_id,:concurso_id,if:  Proc.new { |a| self.quadro and self.quadro.nome=="Estadual"},message: "Informação necessária"
  validates_presence_of :ambiente,message: "Informação necessária",:if=>Proc.new{|a|a.lotacao and a.situacao and a.lotacao.escola? and (a.situacao.nome.include?("Ativo") or a.situacao.nome.include?("Acompanhado"))}
  validates_presence_of :disciplina_concurso_id,if:  Proc.new { |a|a.cargo and a.quadro and a.cargo.nome=="Professor" and (self.quadro.nome=="Estadual" or self.quadro.nome=="Federal")},message: "Informação necessária"
  validates_presence_of :disciplina_atuacao_id,if:  Proc.new { |a| a.cargo and a.cargo.nome=="Professor" and a.ambiente and a.situacao and a.ambiente.nome=="Sala de Aula" and (self.situacao.nome.include? "Ativo" or self.situacao.nome.include? "Acompanhado")}
  validate :validar_tudo
  validate :cpf_valido
  delegate :nome, to: :lotacao, prefix: true, :allow_nil => true

  #Validaçoes antigas
  #validates_presence_of :cadastro,if:  Proc.new { |a| !a.quadro=="Contrato Administrativo"},message: "Informação necessária"

  validates_uniqueness_of :cadastro,scope: :lotacao,:if=>Proc.new { |a|a.quadro and !a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  validates_uniqueness_of :cpf,scope: :cadastro,:if=>Proc.new { |a|a.quadro and !a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  validates_uniqueness_of :cpf,:if=>Proc.new { |a|a.quadro and a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  validate :validate_cadastro
  before_save :nome_maiusculo

  def cpf_valido
    cpf = Cpf.new(self.cpf)
    if !cpf.valido?
     errors.add(:cpf, "não é valido")
   end
 end


 def validar_tudo
  if self.cargo.nil?
    errors.add(:cargo_id, "Informação necessária")
  elsif self.quadro.nil?
    errors.add(:quadro_id, "Informação necessária")
  elsif self.cargo.nil? and self.quadro.nil?
    errors.add(:cargo_id, "Informação necessária")
    errors.add(:quadro_id, "Informação necessária")
  elsif self.ambiente and self.situacao and (self.situacao.nome.include? "Ativo" or self.situacao.nome.include? "Acompanhado") and self.ambiente.nome=="Sala de Aula" and self.cargo and self.quadro and self.cargo.nome=="Professor" and self.disciplina_atuacao.nil?
   errors.add(:disciplina_atuacao_id, "Informação necessária")
 elsif self.quadro and self.quadro.nome!="Contrato Administrativo" and self.cargo and self.quadro and self.cargo.nome=="Professor" and self.disciplina_concurso.nil?
   errors.add(:disciplina_concurso_id, "Informação necessária")
 #elsif self.cargo and self.quadro and self.cargo.nome=="Professor" and self.disciplina_concurso.nil?
   #errors.add(:disciplina_concurso_id, "Informação necessária")
 end
end

def validar_local
  if self.lotacao.nil?
    errors.add(:lotacao_id, "Informação necessária")
  end
end

def validate_cadastro
  if self.quadro and self.cadastro.blank? and !self.quadro.nome.include?("Contrato")
    errors.add(:cadastro, "Informação necessária")
  end
end

def pos_ambiente
  if !self.ambiente_nao_docente.blank? and self.cargo!="Professor"
    self.ambiente = self.ambiente_nao_docente
  elsif self.ambiente_nao_docente.blank? and self.cargo!="Professor"
    self.ambiente = ""
  end
end

def nome_maiusculo
  if !self.nome.blank?
    self.nome = self.nome.upcase
  end
end

end
