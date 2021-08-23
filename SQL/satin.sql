-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema satin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema satin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `satin` DEFAULT CHARACTER SET latin1 ;
USE `satin` ;

-- -----------------------------------------------------
-- Table `satin`.`adicional`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`adicional` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(10) UNSIGNED NOT NULL,
  `texto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`bancos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`bancos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`bitacora` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(15) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `accion` VARCHAR(145) NOT NULL,
  `tabla` VARCHAR(45) NULL DEFAULT NULL,
  `idtabla` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`centrotrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`centrotrabajo` (
  `id_centrotrabajo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(150) NOT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `estatus` VARCHAR(10) NULL DEFAULT 'ACTIVO',
  `clave` VARCHAR(15) NULL DEFAULT '0',
  `edo_mun` VARCHAR(5) NULL DEFAULT '0',
  PRIMARY KEY (`id_centrotrabajo`),
  UNIQUE INDEX `id_centrotrabajo_UNIQUE` (`id_centrotrabajo` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = '		'
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`clues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`clues` (
  `clue` VARCHAR(15) NOT NULL,
  `descripcion` VARCHAR(145) NOT NULL,
  `tipo` INT(11) NOT NULL DEFAULT '1',
  `acreditado` VARCHAR(1) NOT NULL DEFAULT '0',
  `tipo_unidad` VARCHAR(45) NOT NULL,
  `id_centrotrabajo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`clue`, `id_centrotrabajo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`conceptos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`conceptos` (
  `id_concepto` VARCHAR(10) NOT NULL,
  `clave_sat` VARCHAR(3) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_concepto`),
  UNIQUE INDEX `id_concepto_UNIQUE` (`id_concepto` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COMMENT = 'listado de percepciones y deducciones'
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`conceptos_sat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`conceptos_sat` (
  `clave` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(250) NOT NULL,
  `clave_sat` INT(11) NOT NULL DEFAULT '1',
  `tipo` INT(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`clave`))
ENGINE = InnoDB
AUTO_INCREMENT = 158
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`datos_constancias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`datos_constancias` (
  `rfc` VARCHAR(13) NOT NULL,
  `id_concepto` VARCHAR(5) NOT NULL,
  `descripcion` VARCHAR(70) NOT NULL,
  `gravado` DOUBLE NOT NULL DEFAULT '0',
  `exento` DOUBLE NOT NULL DEFAULT '0',
  `activo` INT(11) NOT NULL DEFAULT '0',
  INDEX `RF` (`rfc` ASC) VISIBLE,
  INDEX `id_con` (`id_concepto` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`datos_constancias_rfc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`datos_constancias_rfc` (
  `clave` INT(11) NOT NULL DEFAULT '0',
  `nombre` VARCHAR(70) NULL DEFAULT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `curp` VARCHAR(18) NULL DEFAULT NULL,
  `nss` VARCHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rfc`, `clave`),
  INDEX `rfc` (`rfc` ASC) VISIBLE,
  INDEX `cur` (`curp` ASC) VISIBLE,
  INDEX `nombr` (`nombre` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`datospatronales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`datospatronales` (
  `id_datos_patron` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `registro_patronal` VARCHAR(13) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero_ext` VARCHAR(8) NOT NULL,
  `numero_int` VARCHAR(5) NULL DEFAULT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `poblacion` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cp` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `pais` VARCHAR(25) NOT NULL,
  `riesgo_puesto` TINYINT(4) NULL DEFAULT NULL,
  `periodo_pago` VARCHAR(25) NOT NULL,
  `email` VARCHAR(35) NULL DEFAULT NULL,
  `host` VARCHAR(45) NOT NULL,
  `puerto` SMALLINT(6) NOT NULL,
  `ssl` SMALLINT(6) NULL DEFAULT NULL,
  `usuario` VARCHAR(25) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `regimen` VARCHAR(45) NOT NULL,
  `archivo_logo_app` VARCHAR(100) NULL DEFAULT NULL,
  `archivo_logo_recibo` VARCHAR(100) NULL DEFAULT NULL,
  `logo_app` LONGBLOB NULL DEFAULT NULL,
  `logo_recibo` LONGBLOB NULL DEFAULT NULL,
  `serie` VARCHAR(6) NULL DEFAULT 'BPM',
  `entidad_sncf` VARCHAR(10) NULL DEFAULT '0',
  `codigo_esp` VARCHAR(6) NULL DEFAULT '0',
  `unidad_backup` VARCHAR(1) NULL DEFAULT 'C',
  PRIMARY KEY (`id_datos_patron`),
  UNIQUE INDEX `id_datos_patron_UNIQUE` (`id_datos_patron` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`datostimbrado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`datostimbrado` (
  `id_datostimbrado` INT(11) NOT NULL,
  `fecha_vig_inicial` DATE NULL DEFAULT NULL,
  `fecha_vig_final` DATE NOT NULL,
  `version_cfdi` VARCHAR(10) NOT NULL,
  `version_nomina` VARCHAR(5) NOT NULL,
  `xml_xsi` VARCHAR(45) NOT NULL,
  `xml_cfdi` VARCHAR(45) NULL DEFAULT NULL,
  `xml_nomina` VARCHAR(45) NOT NULL,
  `xml_esquema` VARCHAR(100) NOT NULL,
  `password_key` VARCHAR(25) NOT NULL,
  `num_cert` VARCHAR(25) NOT NULL,
  `archivo_cert` VARCHAR(165) NOT NULL,
  `certificado` BLOB NULL DEFAULT NULL,
  `archivo_key` VARCHAR(165) NOT NULL,
  `_key` BLOB NULL DEFAULT NULL,
  `timbres` DOUBLE NULL DEFAULT '0',
  PRIMARY KEY (`id_datostimbrado`),
  UNIQUE INDEX `id_datostimbrado_UNIQUE` (`id_datostimbrado` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`detalle_archivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_archivos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(11) NOT NULL,
  `id_detalle_nomina` INT(10) UNSIGNED NOT NULL,
  `xml` LONGBLOB NULL DEFAULT NULL,
  `pdf` LONGBLOB NULL DEFAULT NULL,
  `cbb` LONGBLOB NULL DEFAULT NULL,
  `seq` INT(11) NOT NULL DEFAULT '1',
  `rfc` VARCHAR(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `pro` (`producto` ASC) VISIBLE,
  INDEX `id_detalle` (`id_detalle_nomina` ASC) VISIBLE,
  INDEX `rfc` (`rfc` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 157489
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`detalle_cancelados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_cancelados` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(11) NOT NULL,
  `fechacancelacion` DATE NULL DEFAULT NULL,
  `uuid` VARCHAR(45) NOT NULL,
  `xml` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`detalle_conceptos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_conceptos` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(10) UNSIGNED NOT NULL,
  `id_concepto` VARCHAR(5) NOT NULL,
  `importe` DOUBLE NOT NULL DEFAULT '0',
  `importe_ng` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `id_detalle` (`id_detalle_nomina` ASC) VISIBLE,
  INDEX `id_conc` (`id_concepto` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 2226723
DEFAULT CHARACTER SET = latin1
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`detalle_constancias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_constancias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `rfc` VARCHAR(15) NOT NULL,
  `pdf1` LONGBLOB NULL DEFAULT NULL,
  `pdf2` LONGBLOB NULL DEFAULT NULL,
  `anio` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `rfc` (`rfc` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`detalle_nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_nomina` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `producto` VARCHAR(12) NOT NULL,
  `clave` BIGINT(20) UNSIGNED NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `tipor` VARCHAR(2) NOT NULL,
  `clavep` VARCHAR(45) NOT NULL,
  `centro_trabajo` VARCHAR(45) NOT NULL,
  `puesto` VARCHAR(10) NOT NULL,
  `clavepago` VARCHAR(45) NOT NULL,
  `contrato` VARCHAR(15) NOT NULL,
  `fechai` DATE NOT NULL,
  `fechaf` DATE NOT NULL,
  `movimiento` INT(10) UNSIGNED NOT NULL,
  `total1` DOUBLE NOT NULL,
  `total2` DOUBLE NOT NULL,
  `conceptos` INT(10) UNSIGNED NOT NULL,
  `uuid` VARCHAR(45) NOT NULL DEFAULT '0',
  `estado` VARCHAR(3) NOT NULL DEFAULT 'ACT',
  `motivo_can` VARCHAR(45) NULL DEFAULT NULL,
  `remesa` VARCHAR(45) NULL DEFAULT NULL,
  `fechatimbrado` DATETIME NULL DEFAULT NULL,
  `letra` TEXT NULL DEFAULT NULL,
  `folio` VARCHAR(45) NULL DEFAULT NULL,
  `fechaemision` DATETIME NULL DEFAULT NULL,
  `sellosat` TEXT NULL DEFAULT NULL,
  `sellocfdi` TEXT NULL DEFAULT NULL,
  `fechacancelacion` DATETIME NULL DEFAULT NULL,
  `salariodiario` DOUBLE NULL DEFAULT '0',
  `sindicato` VARCHAR(2) NULL DEFAULT 'NO',
  `origen` CHAR(1) NOT NULL DEFAULT '0',
  `seq` INT(11) NOT NULL DEFAULT '0',
  `unidad` VARCHAR(4) NOT NULL DEFAULT '0',
  `importe_propio` DOUBLE NOT NULL DEFAULT '0',
  `instrumento_pago` VARCHAR(2) NULL DEFAULT '00',
  `No_puesto` VARCHAR(4) NULL DEFAULT '0',
  `horas` VARCHAR(1) NULL DEFAULT '0',
  `Digito_ver` VARCHAR(1) NULL DEFAULT '0',
  `pagaduria` VARCHAR(5) NULL DEFAULT '0',
  `control_sar` VARCHAR(20) NULL DEFAULT '0',
  `indicador_mando` VARCHAR(2) NULL DEFAULT '0',
  `fonac` DOUBLE NULL DEFAULT '0',
  `tipo_trabajador` VARCHAR(2) NULL DEFAULT '0',
  `nivel` VARCHAR(2) NULL DEFAULT '00',
  `rango` VARCHAR(1) NULL DEFAULT '0',
  `porcentaje` VARCHAR(8) NULL DEFAULT '0',
  `Edo` VARCHAR(2) NULL DEFAULT '00',
  `Mun` VARCHAR(3) NULL DEFAULT '000',
  `actividad` VARCHAR(5) NULL DEFAULT '00000',
  `proyecto` VARCHAR(4) NULL DEFAULT '0000',
  `partida` VARCHAR(5) NULL DEFAULT '00000',
  `gf_sf` VARCHAR(4) NULL DEFAULT '0000',
  `banco` VARCHAR(3) NULL DEFAULT '000',
  `cuenta_bancaria` VARCHAR(18) NULL DEFAULT '0',
  `isr` DOUBLE NULL DEFAULT '0',
  `ff` VARCHAR(5) NULL DEFAULT '00000',
  `clue` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `rfc`),
  INDEX `pro` (`producto` ASC) VISIBLE,
  INDEX `uu` (`uuid` ASC) VISIBLE,
  INDEX `clav` (`clave` ASC) VISIBLE,
  INDEX `rf` (`rfc` ASC) VISIBLE,
  INDEX `mov` (`movimiento` ASC) VISIBLE,
  INDEX `clue` (`clue` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 157489
DEFAULT CHARACTER SET = latin1
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`detalle_nomina_aud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`detalle_nomina_aud` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(11) NOT NULL,
  `percepciones` DOUBLE NOT NULL DEFAULT '0',
  `deducciones` DOUBLE NOT NULL DEFAULT '0',
  `otrospagos` DOUBLE NOT NULL DEFAULT '0',
  `fechapago` DATE NOT NULL,
  `total` DOUBLE NOT NULL DEFAULT '0',
  `origen` VARCHAR(2) NOT NULL,
  `clue` VARCHAR(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`empleados` (
  `clave` BIGINT(20) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apaterno` VARCHAR(30) NOT NULL,
  `amaterno` VARCHAR(30) NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `nss` VARCHAR(11) NOT NULL,
  `fecha_ingreso` DATE NOT NULL DEFAULT '1900-01-01',
  `email` VARCHAR(100) NOT NULL,
  `activo` TINYINT(1) NULL DEFAULT '1',
  `pass` VARCHAR(10) NULL DEFAULT '0',
  `repss` INT(2) NOT NULL DEFAULT '0',
  `jornada` VARCHAR(30) NOT NULL DEFAULT '01',
  `anio` DOUBLE NULL DEFAULT '0',
  `ultimo_sueldo` DOUBLE NULL DEFAULT '0',
  `ingreso_acumulable` DOUBLE NULL DEFAULT '0',
  `ingreso_no_acumulable` DOUBLE NULL DEFAULT '0',
  `turno` VARCHAR(15) NULL DEFAULT 'MATUTINO',
  `cedula` VARCHAR(15) NULL DEFAULT '',
  `tipo_cedula` VARCHAR(1) NULL DEFAULT '',
  `entidad_cedula` VARCHAR(2) NULL DEFAULT '',
  `especialidad` VARCHAR(65) NULL DEFAULT '',
  PRIMARY KEY (`rfc`),
  INDEX `rfc` (`rfc` ASC) VISIBLE,
  INDEX `pass` (`pass` ASC) VISIBLE,
  INDEX `cur` (`curp` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 1400067529
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`empleadosp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`empleadosp` (
  `clave` DOUBLE NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apaterno` VARCHAR(30) NOT NULL,
  `amaterno` VARCHAR(30) NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `curp` VARCHAR(18) NOT NULL,
  `nss` VARCHAR(15) NOT NULL,
  `fecha_ingreso` DATE NOT NULL DEFAULT '1900-01-01',
  `email` VARCHAR(100) NOT NULL,
  `activo` TINYINT(1) NULL DEFAULT '0',
  `pass` VARCHAR(10) NULL DEFAULT '0',
  `repss` INT(2) NOT NULL DEFAULT '0',
  `jornada` VARCHAR(30) NOT NULL DEFAULT '',
  `anio` DOUBLE NULL DEFAULT '0',
  `ultimo_sueldo` DOUBLE NULL DEFAULT '0',
  `ingreso_acumulable` DOUBLE NULL DEFAULT '0',
  `ingreso_no_acumulable` DOUBLE NULL DEFAULT '0',
  PRIMARY KEY (`rfc`, `clave`),
  INDEX `rfc` (`rfc` ASC) VISIBLE,
  INDEX `pass` (`pass` ASC) VISIBLE,
  INDEX `cur` (`curp` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`empresa` (
  `id_empresa` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(55) NOT NULL,
  `rfc` VARCHAR(13) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero_ext` VARCHAR(20) NOT NULL,
  `numero_int` VARCHAR(10) NULL DEFAULT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(25) NOT NULL,
  `cp` INT(11) NULL DEFAULT NULL,
  `dato1` VARCHAR(45) NOT NULL,
  `dato2` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE INDEX `id_empresa_UNIQUE` (`id_empresa` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COMMENT = 'es lo mismo que perfiles_dependencia'
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`formas_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`formas_pago` (
  `id_formas_pago` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `num_cuenta` VARCHAR(25) NOT NULL,
  `id_banco` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `metodo_pago` TINYINT(4) NOT NULL DEFAULT '0',
  `riesgo` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `estatus` TINYINT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_formas_pago`, `descripcion`),
  UNIQUE INDEX `id_formas_pago_UNIQUE` (`id_formas_pago` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`hist_mov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`hist_mov` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `acceso1` INT(11) NULL DEFAULT NULL,
  `acceso2` INT(11) NULL DEFAULT NULL,
  `rfc` VARCHAR(15) NULL DEFAULT NULL,
  `cod_mov` VARCHAR(8) NULL DEFAULT NULL,
  `lote` VARCHAR(8) NULL DEFAULT NULL,
  `docto` VARCHAR(8) NULL DEFAULT NULL,
  `oficio` VARCHAR(8) NULL DEFAULT NULL,
  `anio_qna` VARCHAR(6) NULL DEFAULT NULL,
  `fechaini` DATE NULL DEFAULT NULL,
  `fechafin` DATE NULL DEFAULT NULL,
  `ctrabajo` VARCHAR(10) NULL DEFAULT NULL,
  `puesto` VARCHAR(10) NULL DEFAULT NULL,
  `unidad` VARCHAR(3) NULL DEFAULT NULL,
  `actividad` VARCHAR(5) NULL DEFAULT NULL,
  `proyecto` VARCHAR(4) NULL DEFAULT NULL,
  `partida` VARCHAR(5) NULL DEFAULT NULL,
  `num_puesto` VARCHAR(5) NULL DEFAULT NULL,
  `gf_sf` VARCHAR(4) NULL DEFAULT NULL,
  `estatus` VARCHAR(1) NULL DEFAULT 'A',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 129124
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`horas_extras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`horas_extras` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(11) NOT NULL,
  `producto` VARCHAR(11) NOT NULL,
  `diad` INT(11) NULL DEFAULT '0',
  `horasd` INT(11) NULL DEFAULT '0',
  `imported` DOUBLE NULL DEFAULT '0',
  `diat` INT(11) NOT NULL,
  `horast` INT(11) NULL DEFAULT '0',
  `importet` DOUBLE NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`incapacidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`incapacidades` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(11) NOT NULL,
  `producto` VARCHAR(11) NOT NULL,
  `faltas` INT(11) NULL DEFAULT '0',
  `dia` INT(11) NULL DEFAULT '0',
  `tipo` VARCHAR(10) NULL DEFAULT '0',
  `importe` DOUBLE NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`indicador_mando`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`indicador_mando` (
  `id` VARCHAR(2) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`isr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`isr` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaini` DATE NULL DEFAULT NULL,
  `fechafin` DATE NULL DEFAULT NULL,
  `limiteinf` DOUBLE NULL DEFAULT NULL,
  `cuotafija` DOUBLE NULL DEFAULT NULL,
  `exe` DOUBLE NULL DEFAULT NULL,
  `subsidio_lim` DOUBLE NULL DEFAULT NULL,
  `subsidio_imp` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`isr_anual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`isr_anual` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaini` DATE NULL DEFAULT NULL,
  `fechafin` DATE NULL DEFAULT NULL,
  `limiteinf` DOUBLE NULL DEFAULT NULL,
  `cuotafija` DOUBLE NULL DEFAULT NULL,
  `exe` DOUBLE NULL DEFAULT NULL,
  `subsidio_lim` DOUBLE NULL DEFAULT NULL,
  `subsidio_imp` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`jornadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`jornadas` (
  `clave` INT(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(100) NOT NULL DEFAULT '',
  `tipo` VARCHAR(5) NULL DEFAULT '',
  `estatus` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`clave`))
ENGINE = MyISAM
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`pagaduria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`pagaduria` (
  `pagaduria` VARCHAR(10) NOT NULL,
  `unidad` VARCHAR(5) NOT NULL,
  `tipo_nomina` ENUM('FED', 'EST', 'UNE', 'FO1', 'FO2', 'FO3', 'REG', 'CON', 'R12') NOT NULL DEFAULT 'FED',
  PRIMARY KEY (`pagaduria`, `unidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`partida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`partida` (
  `clave` VARCHAR(5) NOT NULL DEFAULT '',
  `descripcion` VARCHAR(100) NOT NULL DEFAULT '',
  `Subpartida` VARCHAR(5) NOT NULL DEFAULT '',
  `Subsubpartida` VARCHAR(5) NOT NULL DEFAULT '',
  `tipo` VARCHAR(3) NULL DEFAULT '',
  `estatus` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`clave`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`producto_nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`producto_nomina` (
  `clave` VARCHAR(12) NOT NULL,
  `anio` INT(10) UNSIGNED NOT NULL,
  `mes` INT(10) UNSIGNED NOT NULL,
  `fechapago` DATE NOT NULL,
  `total` DOUBLE NOT NULL DEFAULT '0',
  `deducciones` DOUBLE NOT NULL DEFAULT '0',
  `percepciones` DOUBLE NOT NULL DEFAULT '0',
  `registros` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `estado` VARCHAR(10) NOT NULL DEFAULT 'ACTIVO',
  `descripcion` VARCHAR(45) NOT NULL DEFAULT 'O',
  `estatal` DOUBLE NOT NULL DEFAULT '-1',
  `federal` DOUBLE NOT NULL DEFAULT '-1',
  `timbrados` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `cancelados` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `clue` INT(11) NULL DEFAULT '0',
  `impuestos` DOUBLE NOT NULL DEFAULT '0',
  `leyenda` TEXT NULL DEFAULT NULL,
  `tipo` VARCHAR(1) NOT NULL DEFAULT 'N',
  `tipo_nomina` INT(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clave`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`programa` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `programa` VARCHAR(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`puestos` (
  `id_puestos` VARCHAR(10) NOT NULL,
  `descripcion` VARCHAR(65) NOT NULL,
  `categoria` ENUM('A', 'B', 'C') NOT NULL DEFAULT 'C',
  `rama` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_puestos`),
  UNIQUE INDEX `id_puestos_UNIQUE` (`id_puestos` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `satin`.`rpt_auditoria_xml`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`rpt_auditoria_xml` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_detalle_nomina` INT(11) NOT NULL,
  `percepciones` DOUBLE NOT NULL DEFAULT '0',
  `deducciones` DOUBLE NOT NULL DEFAULT '0',
  `fechapago` DATE NOT NULL,
  `impuestos` DOUBLE NOT NULL DEFAULT '0',
  `total` DOUBLE NOT NULL DEFAULT '0',
  `uuid` VARCHAR(45) NOT NULL,
  `origen` VARCHAR(2) NOT NULL,
  `recurso_propio` DOUBLE NOT NULL DEFAULT '0',
  `concepto_sat` VARCHAR(5) NOT NULL,
  `importe` DOUBLE NOT NULL DEFAULT '0',
  `importe_exe` DOUBLE NOT NULL DEFAULT '0',
  `tipo` VARCHAR(1) NOT NULL,
  `id_concepto` VARCHAR(5) NOT NULL DEFAULT '00000',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1742747
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`rpt_conciliacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`rpt_conciliacion` (
  `id` INT(11) NOT NULL,
  `rfc` VARCHAR(15) NULL DEFAULT NULL,
  `puesto` VARCHAR(15) NULL DEFAULT NULL,
  `clue` VARCHAR(15) NULL DEFAULT NULL,
  `centrotrabajo` VARCHAR(15) NULL DEFAULT NULL,
  `puestod` VARCHAR(100) NULL DEFAULT NULL,
  `centrotrabajod` VARCHAR(100) NULL DEFAULT NULL,
  `clued` VARCHAR(100) NULL DEFAULT NULL,
  `mes` INT(11) NULL DEFAULT NULL,
  `anio` INT(11) NULL DEFAULT NULL,
  `percepciones` DOUBLE NOT NULL DEFAULT '0',
  `deducciones` DOUBLE NOT NULL DEFAULT '0',
  `total` DOUBLE NOT NULL DEFAULT '0',
  `rama` VARCHAR(45) NULL DEFAULT NULL,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_unidad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `puest` (`puesto` ASC) VISIBLE,
  INDEX `rf` (`rfc` ASC) VISIBLE,
  INDEX `clu` (`clue` ASC) VISIBLE,
  INDEX `centro` (`centrotrabajo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`temp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`temp` (
  `uuid` VARCHAR(45) NOT NULL,
  `folio` VARCHAR(45) NULL DEFAULT NULL,
  `fechat` VARCHAR(45) NULL DEFAULT NULL,
  `fechac` VARCHAR(45) NULL DEFAULT NULL,
  `importe` DOUBLE NULL DEFAULT NULL,
  `rfc` VARCHAR(15) NULL DEFAULT NULL,
  `estado_pac` VARCHAR(10) NULL DEFAULT NULL,
  `estado_satin` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_SAT` VARCHAR(45) NULL DEFAULT NULL,
  `ISR` DOUBLE NULL DEFAULT '0',
  PRIMARY KEY (`uuid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`tipo_nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`tipo_nomina` (
  `id` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`tipo_trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`tipo_trabajador` (
  `id` VARCHAR(2) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`tmp_cancelar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`tmp_cancelar` (
  `uuid` VARCHAR(45) NOT NULL,
  `remesa` VARCHAR(45) NOT NULL,
  `motivo` VARCHAR(45) NOT NULL,
  `producto` VARCHAR(15) NOT NULL DEFAULT 'YO',
  `id` DOUBLE NOT NULL,
  INDEX `uui` (`uuid` ASC) VISIBLE,
  INDEX `idd` (`id` ASC) VISIBLE,
  INDEX `pro` (`producto` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`tmp_pac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`tmp_pac` (
  `folio` DOUBLE NOT NULL,
  `rfc` VARCHAR(14) NULL DEFAULT NULL,
  `uuid` VARCHAR(45) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `importe` DOUBLE NULL DEFAULT NULL,
  `cancelado` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  INDEX `foli` (`folio` ASC) VISIBLE,
  INDEX `rf` (`rfc` ASC) VISIBLE,
  INDEX `fech` (`fecha` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`tmp_validacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`tmp_validacion` (
  `uuid` VARCHAR(45) NOT NULL,
  `emisor_rfc` VARCHAR(13) NULL DEFAULT NULL,
  `receptor_rfc` VARCHAR(13) NULL DEFAULT NULL,
  `emisor_nombre` VARCHAR(100) NULL DEFAULT NULL,
  `receptor_nombre` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_exp` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_tim` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_cert` VARCHAR(45) NULL DEFAULT NULL,
  `pac` VARCHAR(13) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `efecto` VARCHAR(10) NULL DEFAULT NULL,
  `estado_cfdi` VARCHAR(10) NULL DEFAULT NULL,
  `Estatus_can` VARCHAR(45) NULL DEFAULT NULL,
  `serie` VARCHAR(5) NULL DEFAULT NULL,
  `movimiento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`unidad_responsable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`unidad_responsable` (
  `clave` VARCHAR(3) NOT NULL DEFAULT '',
  `descripcion` VARCHAR(100) NOT NULL DEFAULT '',
  `estatus` INT(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`clave`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `satin`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`usuarios` (
  `id_usuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(15) NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  `tipo_usuario` VARCHAR(25) NOT NULL DEFAULT 'ADMINISTRADOR',
  `activo` TINYINT(4) NOT NULL DEFAULT '1',
  `permisos` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE INDEX `id_usuarios_UNIQUE` (`id_usuarios` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;

USE `satin` ;

-- -----------------------------------------------------
-- Placeholder table for view `satin`.`constancias_impuestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`constancias_impuestos` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `satin`.`constancias_impuestos_2017`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`constancias_impuestos_2017` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `satin`.`constancias_ingresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`constancias_ingresos` (`id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `satin`.`constancias_ingresos_2017`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `satin`.`constancias_ingresos_2017` (`id` INT);

-- -----------------------------------------------------
-- View `satin`.`constancias_impuestos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `satin`.`constancias_impuestos`;
USE `satin`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `satin`.`constancias_impuestos` AS select `e`.`rfc` AS `rfc`,`c`.`id_concepto` AS `id_concepto`,`c`.`descripcion` AS `descripcion`,sum(`dc`.`importe`) AS `gravado`,sum(`dc`.`importe_ng`) AS `exento`,year(`p`.`fechapago`) AS `año` from ((((satinm`.`datos_constancias_rfc` `e` join satinm`.`conceptos` `c`) join satinm`.`detalle_conceptos` `dc`) join satinm`.`detalle_nomina` `dn`) join satinm`.`producto_nomina` `p`) where ((`e`.`rfc` = `dn`.`rfc`) and ((`dn`.`estado` = 'TIN') or (`dn`.`estado` = 'IMP')) and (`dn`.`id` = `dc`.`id_detalle_nomina`) and (convert(`dc`.`id_concepto` using utf8) = `c`.`id_concepto`) and (`p`.`clave` = `dn`.`producto`) and (`c`.`activo` = 1) and ((`dc`.`importe` + `dc`.`importe_ng`) > 0) and (`c`.`clave_sat` = 2) and (year(`p`.`fechapago`) = 2019)) group by `e`.`rfc`,`c`.`id_concepto`,year(`p`.`fechapago`);

-- -----------------------------------------------------
-- View `satin`.`constancias_impuestos_2017`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `satin`.`constancias_impuestos_2017`;
USE `satin`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `satin`.`constancias_impuestos_2017` AS select `e`.`rfc` AS `rfc`,`c`.`id_concepto` AS `id_concepto`,`c`.`descripcion` AS `descripcion`,sum(`dc`.`importe`) AS `gravado`,sum(`dc`.`importe_ng`) AS `exento`,year(`p`.`fechapago`) AS `año` from ((((satinm`.`datos_constancias_rfc` `e` join satinm`.`conceptos` `c`) join satinm`.`detalle_conceptos` `dc`) join satinm`.`detalle_nomina` `dn`) join satinm`.`producto_nomina` `p`) where ((`e`.`rfc` = `dn`.`rfc`) and ((`dn`.`estado` = 'TIN') or (`dn`.`estado` = 'IMP')) and (`dn`.`id` = `dc`.`id_detalle_nomina`) and (convert(`dc`.`id_concepto` using utf8) = `c`.`id_concepto`) and (`p`.`clave` = `dn`.`producto`) and (`c`.`activo` = 1) and ((`dc`.`importe` + `dc`.`importe_ng`) > 0) and (`c`.`clave_sat` = 2) and (year(`p`.`fechapago`) = 2017)) group by `e`.`rfc`,`c`.`id_concepto`,year(`p`.`fechapago`);

-- -----------------------------------------------------
-- View `satin`.`constancias_ingresos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `satin`.`constancias_ingresos`;
USE `satin`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `satin`.`constancias_ingresos` AS select `e`.`rfc` AS `rfc`,`c`.`id_concepto` AS `id_concepto`,`c`.`descripcion` AS `descripcion`,sum(`dc`.`importe`) AS `gravado`,sum(`dc`.`importe_ng`) AS `exento`,year(`p`.`fechapago`) AS `año` from ((((satinm`.`datos_constancias_rfc` `e` join satinm`.`conceptos` `c`) join satinm`.`detalle_conceptos` `dc`) join satinm`.`detalle_nomina` `dn`) join satinm`.`producto_nomina` `p`) where ((`e`.`rfc` = `dn`.`rfc`) and ((`dn`.`estado` = 'TIN') or (`dn`.`estado` = 'IMP')) and (`dn`.`id` = `dc`.`id_detalle_nomina`) and (convert(`dc`.`id_concepto` using utf8) = `c`.`id_concepto`) and (`p`.`clave` = `dn`.`producto`) and (`c`.`activo` = 0) and ((`dc`.`importe` + `dc`.`importe_ng`) > 0) and (year(`p`.`fechapago`) = 2020)) group by `e`.`rfc`,`c`.`id_concepto`,year(`p`.`fechapago`);

-- -----------------------------------------------------
-- View `satin`.`constancias_ingresos_2017`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `satin`.`constancias_ingresos_2017`;
USE `satin`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `satin`.`constancias_ingresos_2017` AS select `e`.`rfc` AS `rfc`,`c`.`id_concepto` AS `id_concepto`,`c`.`descripcion` AS `descripcion`,sum(`dc`.`importe`) AS `gravado`,sum(`dc`.`importe_ng`) AS `exento`,year(`p`.`fechapago`) AS `año` from ((((satinm`.`datos_constancias_rfc` `e` join satinm`.`conceptos` `c`) join satinm`.`detalle_conceptos` `dc`) join satinm`.`detalle_nomina` `dn`) join satinm`.`producto_nomina` `p`) where ((`e`.`rfc` = `dn`.`rfc`) and ((`dn`.`estado` = 'TIN') or (`dn`.`estado` = 'IMP')) and (`dn`.`id` = `dc`.`id_detalle_nomina`) and (convert(`dc`.`id_concepto` using utf8) = `c`.`id_concepto`) and (`p`.`clave` = `dn`.`producto`) and (`c`.`activo` = 0) and ((`dc`.`importe` + `dc`.`importe_ng`) > 0) and (year(`p`.`fechapago`) = 2017)) group by `e`.`rfc`,`c`.`id_concepto`,year(`p`.`fechapago`);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
