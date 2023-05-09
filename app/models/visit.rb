class Visit < ApplicationRecord
  validates :data, :status, :checkin_at, :checkout_at, presence: true
  validates :status, inclusion: { in: ['PENDENTE', 'REALIZANDO', 'REALIZADA'] }
  validate :data_maior_ou_igual_a_data_atual
  validate :checkin_nao_pode_ser_maior_ou_igual_ao_dia_atual
  validate :checkin_nao_pode_ser_maior_que_checkout
  validate :valid_user

  def data_maior_ou_igual_a_data_atual
    if data.present? && data < Date.today
      errors.add(:data, "deve ser maior ou igual à data atual")
    end
  end

  def checkin_nao_pode_ser_maior_ou_igual_ao_dia_atual
    if checkin_at.present? && checkin_at >= Date.today
      errors.add(:checkin_at, "não pode ser maior ou igual ao dia atual")
    end
  end

  def checkin_nao_pode_ser_maior_que_checkout
    if checkin_at.present? && checkout_at.present? && checkin_at > checkout_at
      errors.add(:checkin, "não pode ser menor que a data de checkout")
    end
  end

  def valid_user
    errors.add(:user_id, 'não é um usuário válido') unless User.exists?(user_id)
  end
  acts_as_paranoid
  belongs_to :user
end
