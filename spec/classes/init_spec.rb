require 'spec_helper'
describe 'cups_pdf' do

  context 'with defaults for all parameters' do
    it { should contain_class('cups_pdf') }
  end
end
