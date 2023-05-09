FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { Faker::Internet.email}
    cpf { "134.674.024-02" }
    password { "123456" }
  end

  factory :visit do
    sequence(:date) {Faker::Date.between(from: Date.today,to: 2.days.from_now)}
    sequence(:status) {rand(0..2)}
    association :user
    sequence(:checkin_at) {Faker::Time.between(from: 3.days.ago,to: 2.days.ago)}
    checkout_at {1.day.ago}
  end
end
