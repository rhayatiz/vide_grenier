DELIMITER $$

DROP TRIGGER IF EXISTS inscription_mailing_auto $$

CREATE TRIGGER inscription_mailing_auto
AFTER INSERT 
ON utilisateur 
FOR EACH ROW 
BEGIN
    
  
	INSERT INTO mailing_list (MAIL_ML) VALUE(NEW.MAIL_UTIL);
    
    
END $$

DELIMITER ;