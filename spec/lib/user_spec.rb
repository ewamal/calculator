require_relative "../../lib/user"

describe User do
  describe ".initialize" do
    it "initializes with specified arguments" do
      email = "ewa@ewa.pl"
      age = 22
      name = "Ewa"
      subject = User.new(email, age, name)
      expect(subject.email).to eq(email)
      expect(subject.age).to eq(age)
      expect(subject.name).to eq(name)
    end
  end

  describe "email" do
    it "reassign value" do
      email = "ewa@ewa.pl"
      age = 22
      name = "Ewa"
      subject = User.new(email, age, name)
      subject.email = "josie@ewa.pl"
      expect(subject.email).to eq("josie@ewa.pl")
    end
  end
end
