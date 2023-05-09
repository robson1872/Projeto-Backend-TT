class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless CPF.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid_cpf)
    end
  end
end
