FactoryGirl.define do
  
  factory :forum do
    name "rider"
    description "a forum where you can talk all about being a rideroo!"

    callback(:after_create) do |forum|
    	forum.allow_role 'rider'
    end

  end

end
