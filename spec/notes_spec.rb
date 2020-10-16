require_relative '../lib/notes.rb'

RSpec.describe Notes do
  it { is_expected.to respond_to(:add) }
  it { is_expected.to respond_to(:see_list) }
  it { is_expected.to respond_to(:select) }
  describe "#add" do
    it "throws an error if input provided is incorrect" do
      expect { subject.add() }.to raise_error(ArgumentError)
      expect { subject.add("title", ) }.to raise_error(ArgumentError)
    end
    it "adds the correctly inputed entry" do
      expect(subject.add("hello", "world")).to eq [{:title=>"hello", :body=>"world"}]
    end
  end
  describe ".see_list" do
    it "puts list of note titles" do
      subject.add("hello", "world")
      subject.add("world", "is great")
      expect { subject.see_list }.to output("1. hello\n2. world\n").to_stdout
    end
  end
  describe "#select" do
    it "selects appropriate note" do
      subject.add("hello", "world")
      expect { subject.select(1) }.to output("hello\nworld\n").to_stdout
    end
    it "throws an error if out-of-range note called" do
      expect {subject.select(1) }.to raise_error "no such note exist"
      expect {subject.select(0) }.to raise_error "no such note exist"
    end
  end
end
