require 'spec_helper'
require 'user'
require 'child'

[:fr].each do |locale|

  describe '#loc_file' do

    before :each do
      @user         = User.new
      @file = File.open('README.md')
      I18n.locale = locale
    end

    it 'An attachment is present' do
      @user.loc_file = @file
      (@user.loc_file.present?).should eql true
    end

    it 'Getter returns a paperclip attachment' do
      @user.loc_file = @file
      @user.loc_file.should be_an_instance_of Paperclip::Attachment
    end

  end

  describe "#loc_file_translations=" do

    it

  end

  describe "#loc_file(#{locale})" do

    before :each do
      @user = User.new
      @file = File.open('README.md')
      I18n.locale = locale
    end

    it 'An attachment is present' do
      @user.loc_file_translations = {locale=> @file}
      (@user.loc_file(locale).present?).should eql true
    end

    it 'Getter returns a paperclip attachment' do
      @user.loc_file_translations = {locale=> @file}
      @user.loc_file.should be_an_instance_of Paperclip::Attachment
    end

  end
  describe '#loc_file=' do

    before :each do
      @user = User.new
      @file = File.open('README.md')
      I18n.locale = locale
    end

    it 'Setter method returns a File' do
      (@user.loc_file=@file).should be_an_instance_of File
    end

  end
end