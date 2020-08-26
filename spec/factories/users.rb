FactoryBot.define do
  factory :user do
    nickname { 'ターロ' }
    email { 'kkk@gmail' }
    password { '0000aaaa' }
    password_confirmation { password }
    family_name { '佐藤' }
    first_name { '太郎' }
    family_name_kana { 'サトウ' }
    first_name_kana { 'タロウ' }
    birth_day { '1900/10/10' }
  end
end
