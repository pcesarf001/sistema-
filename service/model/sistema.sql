
CREATE TABLE IF NOT EXISTS `aeronavesCosan`.`tbPerfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nomePerfil` VARCHAR(45) NOT NULL,
  `dataCriacaoPerfil` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `aeronavesCosan`.`tbUsuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `fkIdPerfilUsuario` INT NOT NULL,
  `emailUsuario` VARCHAR(80) NOT NULL,
  `senhaUsuario` VARCHAR(80) NOT NULL,
  `statusUsuario` INT NOT NULL DEFAULT 0 COMMENT '0 - desativado\n1 - pendente\n2 - ativo',
  `dataCriacaoUsuario` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_tbUsuario_tbPerfil_idx` (`fkIdPerfilUsuario` ASC) ,
  UNIQUE INDEX `emailUsuario_UNIQUE` (`emailUsuario` ASC) ,
  CONSTRAINT `fk_tbUsuario_tbPerfil`
    FOREIGN KEY (`fkIdPerfilUsuario`)
    REFERENCES `aeronavesCosan`.`tbPerfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `aeronavesCosan`.`tbCategoriaMenu` (
  `idCategoriaMenu` INT NOT NULL AUTO_INCREMENT,
  `nomeCategoriaMenu` VARCHAR(45) NOT NULL,
  `iconeCategoriaMenu` VARCHAR(45) NOT NULL,
  `statusCategoriaMenu` INT NOT NULL DEFAULT 0 COMMENT '0 - desativar\n1 - ativado',
  `dataCriacaoCategoriaMenu` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`idCategoriaMenu`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `aeronavesCosan`.`tbItemMenu` (
  `idItemMenu` INT NOT NULL AUTO_INCREMENT,
  `fkIdCategoriaMenuItemMenu` INT NOT NULL,
  `nomeItemMenu` VARCHAR(45) NOT NULL,
  `urlItemMenu` VARCHAR(90) NOT NULL,
  `statusItemMenu` INT NOT NULL DEFAULT 1 COMMENT '0 - desativado\n1 - ativado',
  `dataCriacaoItemMenu` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`idItemMenu`),
  INDEX `fk_tbItemMenu_tbCategoriaMenu1_idx` (`fkIdCategoriaMenuItemMenu` ASC) ,
  CONSTRAINT `fk_tbItemMenu_tbCategoriaMenu1`
    FOREIGN KEY (`fkIdCategoriaMenuItemMenu`)
    REFERENCES `aeronavesCosan`.`tbCategoriaMenu` (`idCategoriaMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `aeronavesCosan`.`tbPermissaoUsuario` (
  `fkIdUsuarioPermissaoUsuario` INT NOT NULL,
  `fkIdItemMenuPermissaoUsuario` INT NOT NULL,
  PRIMARY KEY (`fkIdUsuarioPermissaoUsuario`, `fkIdItemMenuPermissaoUsuario`),
  INDEX `fk_tbUsuario_has_tbItemMenu_tbItemMenu1_idx` (`fkIdItemMenuPermissaoUsuario` ASC) ,
  INDEX `fk_tbUsuario_has_tbItemMenu_tbUsuario1_idx` (`fkIdUsuarioPermissaoUsuario` ASC) ,
  CONSTRAINT `fk_tbUsuario_has_tbItemMenu_tbUsuario1`
    FOREIGN KEY (`fkIdUsuarioPermissaoUsuario`)
    REFERENCES `aeronavesCosan`.`tbUsuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbUsuario_has_tbItemMenu_tbItemMenu1`
    FOREIGN KEY (`fkIdItemMenuPermissaoUsuario`)
    REFERENCES `aeronavesCosan`.`tbItemMenu` (`idItemMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
