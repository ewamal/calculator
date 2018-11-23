require File.expand_path("../../spec_helper.rb", __FILE__)

describe User, type: :model do
  it { should have_many :calculations}

  let(:first_user) do
    User.create(
      first_name: "Ewa",
      last_name: "Malusecka",
      email: 'eewe@ew',
      password: 'fd'
    )
  end

  let(:second_user) do
    User.create(
      first_name: "Ewa",
      last_name: "",
      email: 'eewe@ew',
      password: 'fd'
    )
  end

  let(:third_user) do
    User.create(
      first_name: "",
      last_name: "Malusecka",
      email: 'eewe@ew',
      password: 'fd'
    )
  end

  describe "full_name" do
    it "returns full name" do
      expect(first_user.full_name).to eq("Ewa Malusecka")
    end

    it "returns first name" do
      expect(second_user.full_name).to eq("Ewa")
    end

    it "returns last name" do
      expect(third_user.full_name).to eq("Malusecka")
    end
  end

end
