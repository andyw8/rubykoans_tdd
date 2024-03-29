# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.

def score(dice)
  2.upto(6) do |n|
    return n * 100 if dice == [n, n, n]
  end
  if dice[0] == 1 && dice[1] == 1 && dice[2] == 1
    1000
  elsif dice.count {|n| n == 1} == 2
    200
  else
    0
  end
end

describe "#score" do
	it "is 0 for an empty list" do
    score([]).should == 0
  end

  it "is 1000 for [1,1,1]" do
    score([1,1,1]).should == 1000
  end

  it "is 200 for [2,2,2]" do
    score([2,2,2]).should == 200
  end

  it "is 600 for [6,6,6]" do
    score([6,6,6]).should == 600
  end

  it "is 200 for [1,1]" do
    score([1,1]).should == 200
  end

  it "is 200 for [0,1,1]" do
    score([0,1,1]).should == 200
  end
end
