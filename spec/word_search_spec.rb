require_relative '../word_search'

describe 'straight_line_include?' do
  let(:puzzle) { [
                    ["a", "k", "f", "o", "x", "e", "s"],
                    ["s", "o", "a", "w", "a", "h", "p"],
                    ["i", "t", "c", "k", "e", "t", "n"],
                    ["o", "t", "s", "d", "h", "o", "h"],
                    ["s", "e", "x", "g", "s", "t", "a"],
                    ["u", "r", "p", "i", "w", "e", "u"],
                    ["z", "s", "b", "n", "u", "i", "r"]
                ] }

  describe 'finds words horizontally' do
    it "finds 'foxes'" do
      expect(straight_line_include?('foxes', puzzle)).to eq true
    end

    it "finds 'tsdho'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end

    it "does not find 'coding'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end

    it "does not find 'hello'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end
  end

  describe 'finds words vertically' do
    it "finds 'otters'" do
      expect(straight_line_include?('otters', puzzle)).to eq true
    end

    it "finds 'tote'" do
      expect(straight_line_include?('tote', puzzle)).to eq true
    end

    it "does not find 'ruby'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end

    it "does not find 'frogs'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end
  end

  describe 'finds words diagonally' do
    it "finds bison" do
      expect(straight_line_include?('bison', puzzle)).to eq true
    end

    it "finds 'tsgw'" do
      expect(straight_line_include?('tsgw', puzzle)).to eq true
    end

    it "does not find 'chorus'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end

    it "does not find '34758'" do
      expect(straight_line_include?('tsdho', puzzle)).to eq true
    end
  end

end

describe 'snaking_include?' do
  let(:puzzle) { [
                  ["a", "k", "f", "o", "x", "e", "s"],
                  ["s", "o", "a", "w", "a", "h", "p"],
                  ["i", "t", "c", "k", "e", "t", "n"],
                  ["o", "t", "s", "d", "h", "o", "h"],
                  ["s", "e", "x", "g", "s", "t", "a"],
                  ["u", "r", "p", "i", "w", "e", "u"],
                  ["z", "s", "b", "n", "u", "i", "r"]
               ] }

 describe 'finds snaking words' do
    it "finds 'nighthawks'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "finds 'aottep'" do
      expect(snaking_include?('aottep', puzzle)).to eq true
    end

    it "finds 'sheds'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "finds 'facts'" do
      expect(snaking_include?('aottep', puzzle)).to eq true
    end

    it "finds 'stocks'" do
      expect(snaking_include?('aottep', puzzle)).to eq true
    end

    it "finds 'sweat'" do
      expect(snaking_include?('aottep', puzzle)).to eq true
    end

    it "does not find 'daniel'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "does not find 'andersen'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "does not find '12345'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "does not find 'XX'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

    it "does not find '><*(&^%'" do
      expect(snaking_include?('nighthawks', puzzle)).to eq true
    end

  end

end
