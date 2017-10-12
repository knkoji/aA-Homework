require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookies) { Dessert.new("cookies", 200, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("cookies")
    end
  end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(200)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect(Dessert.new("cakes", "five", chef)).to raise_error(ArgumentError)
    end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookies.add_ingredient("peanut butter")
      expect(cookies.ingredients).to include("peanut butter")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "butter", "chocolate chips", "vanilla"]

      ingredients.each do |ingr|
        cookies.add_ingredient(ingr)
      end

      expect(cookies.ingredients).to eq(ingredients)
      cookies.mix!
      expect(cookies.ingredients).not_to eq(ingredients)
    end
  end

    it "subtracts an amount from the quantity" do
      cookies.eat(100)
      expect(cookies.quantity).to eq(100)
    end

  describe '#eat' do
    it "raises an error if the amount is greater than the quantity" do
      expect(cookies.eat(205)).to raise_errorr("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(brownie.serve).to eq("Chef Tucker the Great Baker has made 100 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
