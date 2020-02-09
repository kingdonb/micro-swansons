require 'rails_helper'

RSpec.describe Table, type: :model do
  context "TableDecorator" do
    describe "#table_deco" do
      it "prints name and table_id in a string configuration" do
        subject.name = "MyString"
        subject.id = 1
        d = subject.table_deco
        expect(d).to eq ('MyString (#1)')
      end
    end
  end

  context "SeatSemaphore" do
    let(:subject) { Table.new(seats: 1, clients: []) }
    describe "#decrement_seats!" do
      it "adds the client to the seats" do
        expect(subject).to receive(:decrement_seats!).
          with(client_ip: 'MyString').and_call_original
        subject.decrement_seats!(client_ip: 'MyString')
        expect(subject.seats).to eq 0
        expect(subject.clients).to eq ['MyString']
      end
      it "gets the lock" do
        pending "How to check that you got the lock"
        raise 'Fail!'
      end
    end
  end
end
