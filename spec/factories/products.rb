FactoryBot.define do
  factory :product do
    association :user
    title "好きを仕事に"
    price 200
    image Rack::Test::UploadedFile.new(File.join('app/assets/images/image.png'))
    description "aaaaaaaaaaa"
  end
end
