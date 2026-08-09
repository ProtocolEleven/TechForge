IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'CPU')
    INSERT INTO Category (Name) VALUES ('CPU');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'GPU')
    INSERT INTO Category (Name) VALUES ('GPU');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Motherboard')
    INSERT INTO Category (Name) VALUES ('Motherboard');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Memory')
    INSERT INTO Category (Name) VALUES ('Memory');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Storage')
    INSERT INTO Category (Name) VALUES ('Storage');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Power Supply')
    INSERT INTO Category (Name) VALUES ('Power Supply');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'CPU Cooler')
    INSERT INTO Category (Name) VALUES ('CPU Cooler');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Case')
    INSERT INTO Category (Name) VALUES ('Case');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Monitor')
    INSERT INTO Category (Name) VALUES ('Monitor');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Keyboard')
    INSERT INTO Category (Name) VALUES ('Keyboard');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Mouse')
    INSERT INTO Category (Name) VALUES ('Mouse');

IF NOT EXISTS (SELECT 1 FROM Category WHERE Name = 'Headset')
    INSERT INTO Category (Name) VALUES ('Headset');