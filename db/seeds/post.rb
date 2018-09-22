require 'faker'

User.find_each do |user|
  Category.find_each do |category|
    Post.create(
      user_id: user.id,
      category_id: category.id,
      subject: Faker::Lorem.characters(20),
      body: Faker::Lorem.characters(200),
      created_at: Time.current,
      updated_at: Time.current
    )
  end
end