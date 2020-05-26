FactoryBot.define do
  factory :tweet do
    text {"hello!"}
    image {"3f0574e2fcda966fd842e343577fbf09.jpg"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end
