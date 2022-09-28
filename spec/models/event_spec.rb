require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {Event.new(title: "Anything",teaser: "Lorem ipsum",bar: "Panorama Bar",day: "Friday",date: "30.09.2022",websource: ["berlinevent","visitevent"])}

  it "has none to begin with" do
    expect(Event.count).to eq (0)
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a teaser" do
    subject.teaser = nil
    expect(subject).to_not be_valid
  end

  it "is valid without a date" do
    subject.day = nil
    expect(subject).to be_valid
  end

  it "is valid without a day" do
    subject.day = nil
    expect(subject).to be_valid
  end

  it "is not valid without websource" do
    subject.websource = nil
    expect(subject).to_not be_valid
  end
end
