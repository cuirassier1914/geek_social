CREATE SCHEMA IF NOT EXISTS `geek_social` DEFAULT CHARACTER SET utf8 ;
USE `geek_social` ;

DROP TABLE IF EXISTS `geek_social`.`likes` ;
DROP TABLE IF EXISTS `geek_social`.`users` ;

-- -----------------------------------------------------
-- Table `geek_social`.`users`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `geek_social`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek_social`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek_social`.`likes` (
  `id` INT NOT NULL,
  `from` INT NOT NULL,
  `to` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_users_idx` (`from` ASC),
  INDEX `fk_likes_users1_idx` (`to` ASC),
  CONSTRAINT `fk_likes_users`
    FOREIGN KEY (`from`)
    REFERENCES `geek_social`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`to`)
    REFERENCES `geek_social`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `geek_social`;

INSERT INTO `geek_social`.`users` (`id`, `login`) VALUES 
(1, 'John'), (2, 'Chris'), (3, 'David'), (4, 'Artur');

INSERT INTO `geek_social`.`likes` (`id`, `from`, `to`) VALUES 
(1, 1, 2), (2, 1, 3), (3, 3, 1), (4, 2, 1), (5, 2, 3), (6, 2, 4);

