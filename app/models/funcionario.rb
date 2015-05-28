class Funcionario < ActiveRecord::Base

  scope :do_quadro, ->(quadro) { where(:quadro_id => quadro) }
  scope :do_cargo, ->(cargo) { where(:cargo_id => cargo) }
  belongs_to :lotacao,class_name: "Administracao::Local"
  belongs_to :usuario
  belongs_to :concurso,class_name: "Administracao::Concurso"
  belongs_to :classe,class_name: "Administracao::Classe"
  belongs_to :cargo,class_name: "Administracao::Cargo"
  belongs_to :quadro,class_name: "Administracao::Quadro"
  belongs_to :disciplina_concurso,:class_name=>"Administracao::Disciplina",:inverse_of=>:funcionarios
  belongs_to :disciplina_atuacao,:class_name=>"Administracao::Disciplina",:inverse_of=>:funcionarios_atuando
  belongs_to :municipio_opcao,:class_name=>"Municipio"
  #enum carga_horaria: [["20 Horas",0],["30 Horas",1],["40 Horas",2]]
  enum carga_horaria: [:"20-horas",:"40-horas"]
  validate :validar_local
  validates_presence_of :nome,:cpf,:cargo,:carga_horaria,:quadro,message: "Informação necessária"
  validates_presence_of :classe_id,:municipio_opcao_id,:situacao_id,:concurso_id,if:  Proc.new { |a| self.quadro and self.quadro.nome="Estadual"},message: "Informação necessária"
  #validates_presence_of :disciplina_concurso_id,if:  Proc.new { |a|a.cargo.nome=="Professor" and (self.quadro.nome="Estadual" or self.quadro.nome="Federal")},message: "Informação necessária"
  #validates_presence_of :disciplina_atuacao_id,if:  Proc.new { |a| a.ambiente.nome=="Sala de Aula" and a.situacao.nome=="Ativo"}
  validate :validate_cadastro
  validate :validar_tudo
  validate :cpf_valido
  delegate :nome, to: :lotacao, prefix: true, :allow_nil => true

  #Validaçoes antigas
  #validates_presence_of :cadastro,if:  Proc.new { |a| !a.quadro=="Contrato Administrativo"},message: "Informação necessária"
  #validates_presence_of :ambiente,message: "Informação necessária",:if=>Proc.new{|a|a.ambiente_nao_docente.blank? or (a.situacao.include?("Ativo") or a.situacao.include?("Acompanhado"))}
  
  validates_uniqueness_of :cadastro,scope: :local,:if=>Proc.new { |a|a.quadro and !a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  validates_uniqueness_of :cpf,scope: :cadastro,:if=>Proc.new { |a|a.quadro and !a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  validates_uniqueness_of :cpf,:if=>Proc.new { |a|a.quadro and a.quadro.nome.include?("Contrato")},message: "Já está cadastrado"
  before_save :nome_maiusculo

  def cpf_valido
    cpf = Cpf.new(self.cpf)
    if !cpf.valido?
     errors.add(:cpf, "não é valido")
   end
 end

 def validar_tudo
  if self.cargo.nil?
    errors.add(:cargo, "Informação necessária")
  elsif self.quadro.nil?
    errors.add(:quadro, "Informação necessária")
  elsif self.cargo.nil? and self.quadro.nil?
    errors.add(:cargo, "Informação necessária")
    errors.add(:quadro, "Informação necessária")
  elsif self.cargo and self.quadro and self.cargo.nome=="Professor" and self.disciplina_atuacao.nil?
   errors.add(:disciplina_atuacao, "Informação necessária")
 elsif self.cargo and self.quadro and self.cargo.nome=="Professor" and self.disciplina_concurso.nil?
   errors.add(:disciplina_concurso, "Informação necessária")
 end
end

def validar_local
  if self.lotacao.nil?
    errors.add(:local_nome, "Informação necessária")
  end
end

def validate_cadastro
  if self.cadastro.blank? and !self.quadro.include?("Contrato")
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
