  require './enumerables.rb'
  describe Enumerable do
  let(:array) {[1,2,3,4]}
  describe "#add" do

    it "it iterates the array" do
      expect(array.my_each).to be_a(Enumerator)
      expect(array.my_each.to_a).to eq(array)
    end
  end
end