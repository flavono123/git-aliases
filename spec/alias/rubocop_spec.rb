require 'minitest/autorun'
require_relative '../../alias/rubocop'

describe Alias::Rubocop do
  subject { Alias::Rubocop }

  describe '.lint' do
    it 'should work' do
      subject.lint
    end
  end
end
