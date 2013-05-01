# SQL code is from project phase 3

# Truncate tables
[:gamers, :items, :consoles, :consoles_gamers].each do |t|
  begin
    ActiveRecord::Base.connection.execute "TRUNCATE TABLE #{t}"
  rescue Exception => e
    puts "Notice: unable to truncate table '#{t}' - #{e.message}"
  end
end


# Wrap in a transaction
ActiveRecord::Base.transaction do

  ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO `gamers`  VALUES
      (1, 'Smokey', 'Gilmore', NOW(), NOW(), NOW()),
      (2, 'Misty', 'Alba', NOW(), NOW(), NOW()),
      (3, 'Eric', 'Beerman', NOW(), NOW(), NOW())
  SQL

  ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO `items` VALUES
      (1, 1, 'Power Cord', 'Cords', 'Has room for 10 devices', NOW(), NOW()),
      (2, 1, 'Television', 'Screens', 'It is a 120" screen', NOW(), NOW()),
      (3, 1, 'Projector', 'Screens', 'Good for movie nights', NOW(), NOW()),
      (4, 2, 'Router', 'Networking', 'This will be useful for LAN parties', NOW(), NOW()),
      (5, 3, 'Server', 'Computers', 'I have this server which will be idea for LAN parties', NOW(), NOW()),
      (6, 3, 'Coffee Maker', 'Misc', 'If you ever need coffee, just ask!', NOW(), NOW())
  SQL

  ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO `consoles` VALUES
      (1, 'Xbox 360', 'DVD', 'Microsoft', NOW(), NOW()),
      (2, 'PlayStation 3', 'BluRay', 'Sony', NOW(), NOW()),
      (3, 'Nintendo 64', 'Cartridge', 'Nintendo', NOW(), NOW())
  SQL

  ActiveRecord::Base.connection.execute <<-SQL
    INSERT INTO `consoles_gamers` VALUES
      (1, 1, 1, 2, 8, 'I have many consoles if you need them', NOW(), NOW()),
      (2, 3, 3, 1, 4, 'All I have is an N64 :(', NOW(), NOW())
  SQL

end