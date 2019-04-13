FactoryBot.define do
  factory :base_post, class: Post do
    user_id { 1 }
    category_id { 1 }
    subject { 'test subject' }
    body { 'test body' }

    trait :skip_validate do
      to_create { | instance | instance.save(validate: false) }
    end
  end
end