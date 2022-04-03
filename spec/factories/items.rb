FactoryBot.define do
  factory :item do
    name {'サンプル商品'}
    explanation {'商品の説明文'}
    category { Category.find(Faker::Number.within(range: 2..11))}
    status { Status.find(Faker::Number.within(range: 2..7))}
    shipping_cost { ShippingCost.find(Faker::Number.within(range: 2..3))}
    region { Region.find(Faker::Number.within(range: 2..48))}
    delivery_days { DeliveryDays.find(Faker::Number.within(range: 2..4))}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end


end
