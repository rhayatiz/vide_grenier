DELIMITER //

-- Rajoute le mail dans la mailing_list
CREATE PROCEDURE add_mailing_list (IN mail VARCHAR(100))
BEGIN
	INSERT INTO mailing_list(MAIL_ML) VALUES (mail);
END //

-- Supprime le mail de la mailing list
CREATE PROCEDURE remove_mailing_list (IN mail VARCHAR(100))
BEGIN
	DELETE FROM mailing_list WHERE MAIL_ML = mail;
END //

DELIMITER ;