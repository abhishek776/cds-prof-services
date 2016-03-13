Given /the following dogs exist/ do |dogs_table|
  dogs_table.hashes.each do |dog|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Dog.create(dog)
  end
end

Given /the following mix links exist/ do |mix_link_table|
  mix_link_table.hashes.each do |mix_link|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    DogMixLinker.create(mix_link)
  end
end

Given /the following personality links exist/ do |personality_link_table|
  personality_link_table.hashes.each do |personality_link|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    DogPersonalityLinker.create(personality_link)
  end
end