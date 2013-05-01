FactoryGirl.define do
    factory :post do
        sequence(:title) { |n| "A book #{n}" }
        name  "Johnny"
        content "Lorem Ipsum"
    end    
end