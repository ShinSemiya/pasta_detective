require 'spec_helper'
require_relative './pasta_spec_helper.rb'

describe PastaMixer do
  let!(:pasta_mixer){ PastaMixer.new }

  describe "#generate_random_satement" do
    context "hoge * 3 is shuffled" do
      include PastaSpecHelper

      let!(:refrain_num){ 3 }
      let!(:target_str) { 'hoge' }

      it "array size is 12" do
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        result.size.should == 12 # 4文字 * 3
      end

      it "array size is 12" do
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        how_many_include(result, 'h').should == refrain_num
     end

      it "char type is 4, not changed" do #文字の種類は増えないよね？
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        char_type(result).should == 4
      end
    end

    context "test_string * 4 is shuffled" do
      include PastaSpecHelper

      let!(:refrain_num){ 4 }
      let!(:target_str) { 'test_string' }

      it "array size is 12" do
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        result.size.should == 44 # 11文字 * 4
      end

      it "array size is 12" do
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        how_many_include(result, 'e').should == refrain_num
        how_many_include(result, 'i').should == refrain_num
      end

      it "char type is 4, not changed" do #文字の種類は増えないよね？
        result = pasta_mixer.generate_random_satement(target_str, refrain_num)
        char_type(result).should == 8 # 11文字のうち eが2回,tが3回,登場するので8種類
      end
    end
  end

  describe "#generate_random_satement" do
    context "insert '1234' to 'hogefuga'" do
      include PastaSpecHelper

      let!(:base_string)     { 'hogefuga'.split('') }
      let!(:inserting_string){ '1234' }

      it "char type is 4 + 8, not changed" do #文字の種類は増えないよね？
        result = pasta_mixer.random_insert(base_string, inserting_string)
        char_type(result).should == 11 # eが2回登場するので7 + 4 種類
      end

      it "insert statement's order is guarantee" do
        result = pasta_mixer.random_insert(base_string, inserting_string)
        result.index('1').should < result.index('2')
        result.index('2').should < result.index('3')
        result.index('3').should < result.index('4')
      end
    end
  end

  describe "#mixed_statement" do
    context "insert 5678 into shuffled hoge * 3" do
      let!(:base_string)     { 'hoge' }
      let!(:inserting_string){ '5678' }
      let!(:refrain)         { 3 }

      it "return class is string" do
        pasta_mixer.mix_pasta(base_string, refrain, inserting_string).class.should == String
      end

      it "return length is 4*3 + 4" do
        pasta_mixer.mix_pasta(base_string, refrain, inserting_string).length.should == 16
      end

      it "insert statement's order is guarantee" do
        result = pasta_mixer.mix_pasta(base_string, refrain, inserting_string)
        result.index('5').should < result.index('6')
        result.index('6').should < result.index('7')
        result.index('7').should < result.index('8')
      end
    end

    context "insert neapolitan into shuffled 'spagetti' * 50" do
      let!(:base_string)     { 'spagetti' }
      let!(:inserting_string){ 'neapolitan' }
      let!(:refrain)         { 50 }

      it "return class is string" do
        pasta_mixer.mix_pasta(base_string, refrain, inserting_string).class.should == String
      end

      it "return length is 4*3 + 4" do
        pasta_mixer.mix_pasta(base_string, refrain, inserting_string).length.should == 410
      end

      it "insert statement's order is guarantee" do
        result = pasta_mixer.mix_pasta(base_string, refrain, inserting_string)
        result.index('n').should < result.index('e',result.index('n'))
        result.index('e').should < result.index('a',result.index('e'))
        result.index('a').should < result.index('p',result.index('a'))
        result.index('p').should < result.index('o',result.index('p'))
        result.index('o').should < result.index('l',result.index('o'))
        result.index('l').should < result.index('i',result.index('l'))
        result.index('i').should < result.index('t',result.index('i'))
        result.index('t').should < result.index('a',result.index('t'))
        result.index('a').should < result.index('n',result.index('a'))
      end


      it "insert statement's order is guarantee" do
        result = pasta_mixer.mix_pasta(base_string, refrain, '1234567890')
        result.index('1').should < result.index('2')
        result.index('2').should < result.index('3')
        result.index('3').should < result.index('4')
        result.index('4').should < result.index('5')
        result.index('5').should < result.index('6')
        result.index('6').should < result.index('7')
        result.index('7').should < result.index('8')
        result.index('8').should < result.index('9')
        result.index('9').should < result.index('0')
      end
    end
  end
end