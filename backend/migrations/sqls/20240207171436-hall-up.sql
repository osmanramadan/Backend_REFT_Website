CREATE TYPE CHECK_STATUS AS ENUM('false', 'true');

CREATE TABLE IF NOT EXISTS hall (
    ID           SERIAL PRIMARY KEY,
    NAME         VARCHAR(255) NOT NULL,
    CAPACITY     VARCHAR(255) NOT NULL,
    CITY         VARCHAR(255) NOT NULL,
    PRICE_HOUR   VARCHAR(255) NOT NULL,
    LOCATION     VARCHAR(255) NOT NULL,
    DETAILS      TEXT NOT NULL,
    IMAGES       VARCHAR(2000)[] NOT NULL,
    COVER_IMAGE  VARCHAR(500) NOT NULL,
    PDF          VARCHAR(500) NOT NULL,
    VIDEO        VARCHAR(500) NOT NULL,
    USER_ID      INT NOT NULL,
    CHECKED      CHECK_STATUS DEFAULT 'false', -- Use the ENUM type for CHECKED column

    CONSTRAINT FK_hall_user
    FOREIGN KEY (USER_ID)
    REFERENCES users(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

