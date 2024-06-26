-- CREATE TYPE roleChoose AS ENUM('TEACHER','OWNER','admin_1/id=80226753244');
-- CREATE TYPE verifyChoose AS ENUM('false', 'true');


CREATE TABLE IF NOT EXISTS users (
    ID                     SERIAL PRIMARY KEY,
    EMAIL                  VARCHAR(255) NOT NULL UNIQUE,
    PASSWORD               TEXT NOT NULL,
    NAME                   VARCHAR(255) NOT NULL,
    PHONE                  VARCHAR(255) NOT NULL,
    CITY                   VARCHAR(255) NOT NULL,
    ROLE                   roleChoose   DEFAULT 'OWNER',
    PROFILE_IMG            VARCHAR(255) DEFAULT NULL,
    PASSWORD_CHANGED_AT    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    PASSWORD_VERIFIED_CODE VARCHAR(255) DEFAULT 'undefined',
    PASSWORD_RESET_EXPIRES TIMESTAMP    DEFAULT NULL, 
    RESET_CODE_VERIFIED     verifyChoose DEFAULT 'false'
);
