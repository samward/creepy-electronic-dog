FactoryBot.define do
  factory :article do
    sequence :external_id

    trait :creepy_electronic_dog do
      raw_json { JSON.parse(File.read("spec/fixtures/creepy_electronic_dog.json"))}
    end
  end
end
