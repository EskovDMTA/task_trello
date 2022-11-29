FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password avatar name description] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :state, %i[new_task in_development in_qa in_code_review ready_for_release released archived].cycle

  sequence :expired_at do |n|
    Date.today + n.minutes
  end
end
