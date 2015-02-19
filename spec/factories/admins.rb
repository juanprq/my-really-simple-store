FactoryGirl.define do
	factory :admin do
		password 'foobar123'
		password_confirmation { |u| u.password }
		email 'admin@local.com'
		name 'administrator'
		identification '1094891516'
		phone '3113412790'
	end
end