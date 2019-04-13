FactoryBot.define do
  factory :base_category, class: Category do
    name { 'test category' }
    code { 'test code' }
    sort_num { 1 }
  end
end