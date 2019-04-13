FactoryBot.define do
  factory :base_reply, class: Reply do
    user_id { 1 }
    post_id { 1 }
    body { 'test body' }

    trait :skip_validate do
      to_create { | instance | instance.save(validate: false) }
    end
  end
end