class Client < ActiveRecord::Base


  has_many :boletos

 # validates :name, presence: true, length: { minimum: 2 }
 # validates :student, presence: true, length: { minimum: 2 }
 # validates :cpf, presence: true, length: { minimum: 2 }
 # validates :email, presence: true, length: { minimum: 2 }
 # validates :turma, presence: true, length: { minimum: 2 }
 # validates :address, presence: true, length: { minimum: 2 }
 # validates :registro_aluno, presence: true, length: { minimum: 2 }

  def to_h
    result = {}

    result[:sacado] = name
    result[:sacado_documento] = document
    result[:sacado_endereco] = address if address.present?

    result
  end
end
