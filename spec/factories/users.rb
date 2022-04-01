FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '田中' }
    first_name { 'メアリー' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'メアリー' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '#{(Time.now.year - 5)}-12-31') }
  end
end
