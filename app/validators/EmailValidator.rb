class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.include?('@')
      record.errors.add(attribute, (options[:message] || "wrong email format, missing '@'"))
    end
  end
end
