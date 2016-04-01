Given /the following professionals exist/ do |professionals_table|\
  professionals_table.hashes.each do |professional|
    new_professional = Professional.new()
    new_professional.name = professional[:name]
    new_professional.motto = professional[:motto]
    new_professional.description = professional[:description]
    new_professional.save!
  end
  
end