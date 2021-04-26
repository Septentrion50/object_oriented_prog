require_relative '../lib/user'

describe 'Check the validity and correct working of the User class' do

  describe 'create a new instance and test its methods' do
    it 'create the user julie' do
      julie = User.new('julie@email.com', 32)

      expect(julie.age).to eq(32)
      expect(julie.email).to eq('julie@email.com')
    end

    it 'create another user jean' do
      jean = User.new('jean@email.com', 29)

      expect(jean.age).to eq(29)
      expect(jean.email).to eq('jean@email.com')
    end
  end

  describe 'Test the class method all' do
    it 'create two users and verify if the class has two' do
      chris = User.new('chris@email.com', 40)
      michel = User.new('michel@email.com', 20)
      test = User.all

      expect(test).to be_a_kind_of(Array)
      expect(test.size).to eq(4)
      expect(test[2].age).to eq(40)
      expect(test[2].email).to eq('chris@email.com')
      expect(test[3].age).to eq(20)
      expect(test[3].email).to eq('michel@email.com')
    end
  end

  describe 'Find user by email' do
    it 'Use the class method find_by_email' do
      veronique = User.new('veronique@email.com', 40)
      expect(User.find_by_email('veronique@email.com')).to eq(veronique)
    end
  end
end
