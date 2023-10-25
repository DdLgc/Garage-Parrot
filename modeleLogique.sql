-- Table pour les utilisateurs (administrateurs et employés)
CREATE TABLE User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email_Address VARCHAR(100) UNIQUE,
    Password VARCHAR(100),
    Role ENUM('Administrator', 'Employee')
);

-- Table pour les véhicules d'occasion
CREATE TABLE UsedVehicle (
    Vehicle_ID INT AUTO_INCREMENT PRIMARY KEY,
     Price DECIMAL(10, 2),  -- Le chiffre "10" représente la précision du nombre. Cela signifie qu'un nombre décimal stocké dans cette colonne peut avoir jusqu'à 10 chiffres au total, avant et après la virgule. Le chiffre "2" représente l'échelle du nombre, c'est-à-dire le nombre de chiffres qui peuvent être stockés après la virgule. 
    Image VARCHAR(100),
    Year_of_Manufacture INT,
    Mileage INT,
    Image_Gallery JSON, -- Stockage des images sous forme JSON
    Features TEXT,       -- Texte pour les caractéristiques
    Equipment TEXT       -- Texte pour les équipements
);

-- Table pour les horaires d'ouverture
CREATE TABLE OpeningHours (
    Hour_ID INT AUTO_INCREMENT PRIMARY KEY,
    Day_of_the_Week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
    Opening_Time TIME,
    Closing_Time TIME
);

-- Table pour les témoignages clients
CREATE TABLE CustomerTestimonial (
    Testimonial_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Comment TEXT,
    Rating INT,
    Moderation_Status ENUM('Pending', 'Approved')
);

-- Relation entre l'administrateur et les employés pour la création de comptes
CREATE TABLE CreateAccount (
    Administrator_ID INT,
    Employee_ID INT,
    FOREIGN KEY (Administrator_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Employee_ID) REFERENCES User(User_ID)
);

-- Relation entre les employés et les véhicules d'occasion pour l'ajout de véhicules
CREATE TABLE AddUsedVehicle (
    Employee_ID INT,
    Vehicle_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES UsedVehicle(Vehicle_ID)
);

-- Relation entre l'administrateur et les informations d'accueil
CREATE TABLE ModifyHomepageInformation (
    Administrator_ID INT,
    FOREIGN KEY (Administrator_ID) REFERENCES User(User_ID)
);

-- Relation entre les visiteurs et les véhicules d'occasion pour le filtrage
CREATE TABLE FilterUsedVehiclesList (
    Visitor_ID INT,
    Vehicle_ID INT,
    FOREIGN KEY (Visitor_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES UsedVehicle(Vehicle_ID)
);

-- Relation entre les employés et les témoignages clients pour l'ajout de témoignages
CREATE TABLE AddCustomerTestimonial (
    Employee_ID INT,
    Testimonial_ID INT,
    FOREIGN KEY (Employee_ID) REFERENCES User(User_ID),
    FOREIGN KEY (Testimonial_ID) REFERENCES CustomerTestimonial(Testimonial_ID)
);
