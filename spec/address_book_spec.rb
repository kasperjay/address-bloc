require_relative 'entry'

    class AddressBook
        attr_reader :entries
       
        def initialize
            @entries = []
        end
    end
    
        def add_entry(name, phone_number, email)
            index = 0
            entries.each do |entry|
                if name < entry.name
                    break
                end
               index+= 1
            end
            entries.insert(index, Entry.new(name, phone_number, email))
        end
        
        def remove_entry(name, phone_number, email)
            index = 0
            entries.each do |entry|
                if name = entry.name
                    entries.delete_at(index)
                end
            index+= 1
            end
        end
             
require_relative '../models/address_book'
   
RSpec.describe AddressBook do
        describe "attributes" do
            it "responds to entries" do
                book = AddressBook.new
                expect(book).to respond_to(:entries)
            end
      
            it "initializes entries as an array" do
                book = AddressBook.new
                expect(book.entries).to be_an(Array)
            end
 
            it "initializes entries as empty" do
                book = AddressBook.new
                expect(book.entries.size).to eq(0)
                end
            end

        describe "#add_entry" do
            it "adds only one entry to the address book" do
                book = AddressBook.new
                book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
         
                expect(book.entries.size).to eq(1)
            end
         
            it "adds the correct information to entries" do
                book = AddressBook.new
                book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                new_entry = book.entries[0]
         
                expect(new_entry.name).to eq('Ada Lovelace')
                expect(new_entry.phone_number).to eq('010.012.1815')
                expect(new_entry.email).to eq('augusta.king@lovelace.com')
            end
            
            describe "#remove_entry" do
            it "removes only one entry to the address book" do
                book = AddressBook.new
                book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

                expect(book.entries.size).to eq(book.entries.size - 1)
            end
            end
        end
    end