test1_user = User.new(id: 1, name: 'test1', email: 'test1@test.com', password: 'password', created_at: Time.current, updated_at: Time.current)
test1_user.save!
test2_user = User.new(id: 2, name: 'test2', email: 'test2@test.com', password: 'password', created_at: Time.current, updated_at: Time.current)
test2_user.save!
test3_user = User.new(id: 3, name: 'test3', email: 'test3@test.com', password: 'password', created_at: Time.current, updated_at: Time.current)
test3_user.save!