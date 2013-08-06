require_relative './pasta_spec_helper.rb'
require 'spec_helper'

describe NeapolitanDetective do
  let!(:base_string){ 'qwertyuiopasdfghjkl+' } # 20文字
  let!(:refrain)    { 5 }
  let!(:hide_string){ '12345' } # 5文字

  describe "#initialize" do
    it "sum of mix_pasta is equal to one of base_string and hide_string" do
      neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
      neapolitan_detective.mix_pasta.size.should == 105 # 20*5 + 5
    end

    it "string of search target is set" do
      neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
      neapolitan_detective.neapolitan.should == hide_string.reverse.split('')
    end
  end

  describe "#investigate_pasta" do
    it "return size is ok" do
      neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
      neapolitan_detective.investigate_pasta.size.should == 115 # 20*5 + (5 * 3) neapolitan は 1文字が "[]"で3文字に増える
    end

    it "char type is keep" do #文字の種類は[]以外増えないよね？
      neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
      neapolitan_detective.investigate_pasta.split("").uniq.sort.should ==
          %w[ + 1 2 3 4 5 [ ] a d e f g h i j k l o p q r s t u w y ]
    end

    context "Story Test" do
      include PastaSpecHelper

      let!(:base_string){ 'spagetti' } # 8文字
      let!(:refrain)    { 50 }
      let!(:hide_string){ 'neapolitan' } # 10文字

      it "return size is ok" do
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        neapolitan_detective.investigate_pasta.size.should == 430 # 8*50 + (10 * 3) neapolitan は 1文字が "[]"で3文字に増える
      end

      it "char type is keep" do #文字の種類は[]以外増えないよね？
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        neapolitan_detective.investigate_pasta.split("").uniq.sort.should ==
            %w[ [ ] a e g i l n o p s t]
      end

      it "all 10 char is marked" do # 10文字すべて[]でマークされているか？
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        result = neapolitan_detective.investigate_pasta
        how_many_include_in_string(result, '[').should == 10
        how_many_include_in_string(result, ']').should == 10
      end

    end
  end

  describe "#mark_neapolitan" do
    context "match string of search target" do
      it "return is input binded []" do
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        neapolitan_detective.mark_neapolitan('1').should == '[1]'
      end

      # 対象文字列'3'はneapolitan(search_target)にはあるがいまの検索対象じゃない
      context "includeing neapolitan(search_target), but NOT now target" do
        it "return is equal to input" do
          neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
          neapolitan_detective.mark_neapolitan('3').should == '3'
        end
      end
    end

    context "NOT match string of search target" do
      it "return is equal to input" do
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        neapolitan_detective.mark_neapolitan('a').should == 'a'
      end
    end
  end
  describe "#is_neapolitan?" do
    let!(:neapolitan_detective){ NeapolitanDetective.new(base_string, refrain, hide_string) }

    context "string is neapolitan" do
      it "return true" do
        neapolitan_detective.is_neapolitan?("1").should be_true
      end

      it "'neapolitan(search_target)' is changed" do
        neapolitan_detective.neapolitan.should == %w[ 5 4 3 2 1 ]
        neapolitan_detective.is_neapolitan?('1')
        neapolitan_detective.neapolitan.should == %w[ 5 4 3 2 ]
      end
    end

    context "string is NOT neapolitan" do
      it "return false" do
        neapolitan_detective = NeapolitanDetective.new(base_string, refrain, hide_string)
        neapolitan_detective.is_neapolitan?("a").should be_false
      end

      it "'neapolitan(search_target)' is kept" do
        neapolitan_detective.neapolitan.should == %w[ 5 4 3 2 1 ]
        neapolitan_detective.is_neapolitan?('a')
        neapolitan_detective.neapolitan.should == %w[ 5 4 3 2 1 ]
      end
    end
  end
end
