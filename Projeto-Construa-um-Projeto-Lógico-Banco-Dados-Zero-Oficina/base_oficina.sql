 create database oficina;
use oficina;






-- -----------------------------------------------------
-- Tabela Veiculo
-- -----------------------------------------------------
CREATE TABLE Veiculo (
  idVeiculo INT NOT NULL,
  placa VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idVeiculo));


-- -----------------------------------------------------
-- Tabela Cliente
-- -----------------------------------------------------
CREATE TABLE Cliente (
  idCliente INT NOT NULL,
  numero_documento INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  atividade_atuacao VARCHAR(45) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  Veiculo_idVeiculo INT NOT NULL,
  PRIMARY KEY (idCliente),
  INDEX fk_Cliente_Veiculo1_idx (Veiculo_idVeiculo ASC),
  CONSTRAINT fk_Cliente_Veiculo1
    FOREIGN KEY (Veiculo_idVeiculo)
    REFERENCES Veiculo (idVeiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Oficina_mecanica
-- -----------------------------------------------------
CREATE TABLE Oficina_mecanica (
  idOficina_mecanica INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  serviços_prestados VARCHAR(45) NOT NULL,
  nome_funcionario VARCHAR(45) NOT NULL,
  PRIMARY KEY (idOficina_mecanica));


-- -----------------------------------------------------
-- Tabela Equipe
-- -----------------------------------------------------
CREATE TABLE Equipe (
  idEquipe INT NOT NULL,
  codigo_funcionario VARCHAR(45) NOT NULL,
  nome_equipe VARCHAR(45) NOT NULL,
  endereço VARCHAR(45) NOT NULL,
  especialidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEquipe));


-- -----------------------------------------------------
-- Tabela Ordem_Serviço
-- -----------------------------------------------------
CREATE TABLE Ordem_Serviço (
  idOrdem_Serviço INT NOT NULL,
  numero_os INT NOT NULL,
  nome_mecanico VARCHAR(45) NOT NULL,
  revisão VARCHAR(45) NOT NULL,
  concerto VARCHAR(45) NOT NULL,
  data_emissão DATE NOT NULL,
  valor FLOAT NOT NULL,
  data_conclusão VARCHAR(45) NOT NULL,
  status_os VARCHAR(45) NOT NULL,
  serviços_disponiveis VARCHAR(45) NOT NULL,
  Veiculo_idVeiculo INT NOT NULL,
  Equipe_idEquipe INT NOT NULL,
  PRIMARY KEY (idOrdem_Serviço),
  INDEX fk_Ordem_Serviço_Veiculo1_idx (Veiculo_idVeiculo ASC),
  INDEX fk_Ordem_Serviço_Equipe1_idx (Equipe_idEquipe ASC),
  CONSTRAINT fk_Ordem_Serviço_Veiculo1
    FOREIGN KEY (Veiculo_idVeiculo)
    REFERENCES Veiculo (idVeiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Ordem_Serviço_Equipe1
    FOREIGN KEY (Equipe_idEquipe)
    REFERENCES Equipe (idEquipe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Cliente_Oficina_mecanica
-- -----------------------------------------------------
CREATE TABLE Cliente_Oficina_mecanica (
  Cliente_idCliente INT NOT NULL,
  Oficina_mecanica_idOficina_mecanica INT NOT NULL,
  PRIMARY KEY (Cliente_idCliente, Oficina_mecanica_idOficina_mecanica),
  INDEX fk_Cliente_has_Oficina_mecanica_Oficina_mecanica1_idx (Oficina_mecanica_idOficina_mecanica ASC),
  INDEX fk_Cliente_has_Oficina_mecanica_Cliente1_idx (Cliente_idCliente ASC),
  CONSTRAINT fk_Cliente_has_Oficina_mecanica_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Cliente_has_Oficina_mecanica_Oficina_mecanica1
    FOREIGN KEY (Oficina_mecanica_idOficina_mecanica)
    REFERENCES Oficina_mecanica (idOficina_mecanica)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Pessoa_fisica
-- -----------------------------------------------------
CREATE TABLE Pessoa_fisica (
  idPessoa_fisica INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cpf INT NOT NULL,
  Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idPessoa_fisica),
  INDEX fk_Pessoa_fisica_Cliente1_idx (Cliente_idCliente ASC),
  CONSTRAINT fk_Pessoa_fisica_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Pessoa_juridica
-- -----------------------------------------------------
CREATE TABLE Pessoa_juridica (
  idPessoa_juridica INT NOT NULL,
  nome_fantasia VARCHAR(45) NOT NULL,
  cnpj INT NOT NULL,
  Cliente_idCliente INT NOT NULL,
  PRIMARY KEY (idPessoa_juridica),
  INDEX fk_Pessoa_juridica_Cliente1_idx (Cliente_idCliente ASC),
  CONSTRAINT fk_Pessoa_juridica_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Estoque_peça
-- -----------------------------------------------------
CREATE TABLE Estoque_peça (
  idEstoque_peça INT NOT NULL,
  nome_peça VARCHAR(45) NOT NULL,
  quantidade_peça INT NOT NULL,
  valor_peça FLOAT NOT NULL,
  PRIMARY KEY (idEstoque_peça));


-- -----------------------------------------------------
-- Tabela  Ordem_Serviço_Estoque
-- -----------------------------------------------------
CREATE TABLE  Ordem_Serviço_Estoque (
  Estoque_peça_idEstoque_peça INT NOT NULL,
  Ordem_Serviço_idOrdem_Serviço INT NOT NULL,
  PRIMARY KEY (Estoque_peça_idEstoque_peça, Ordem_Serviço_idOrdem_Serviço),
  INDEX fk_Estoque_peça_Ordem_Serviço_Ordem_Serviço1_idx (Ordem_Serviço_idOrdem_Serviço ASC),
  INDEX fk_Estoque_peça_has_Ordem_Serviço_Estoque_peça1_idx (Estoque_peça_idEstoque_peça ASC),
  CONSTRAINT fk_Estoque_peça_has_Ordem_Serviço_Estoque_peça1
    FOREIGN KEY (Estoque_peça_idEstoque_peça)
    REFERENCES Estoque_peça (idEstoque_peça)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Estoque_peça_Ordem_Serviço_Ordem_Serviço1
    FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço)
    REFERENCES Ordem_Serviço (idOrdem_Serviço)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Orçamento
-- -----------------------------------------------------
CREATE TABLE Orçamento (
  idOrçamento INT NOT NULL,
  identificação_os VARCHAR(45) NOT NULL,
  nome_serviço_realizado VARCHAR(45) NOT NULL,
  valor_orçamento FLOAT NOT NULL,
  aprovado_cliente VARCHAR(5) NOT NULL,
  data_orçamento DATE NOT NULL,
  PRIMARY KEY (idOrçamento));


-- -----------------------------------------------------
-- Tabela Cliente_para_Orçamento
-- -----------------------------------------------------
CREATE TABLE Cliente_para_Orçamento (
  Cliente_idCliente INT NOT NULL,
  Orçamento_idOrçamento INT NOT NULL,
  PRIMARY KEY (Cliente_idCliente, Orçamento_idOrçamento),
  INDEX fk_Cliente_has_Orçamento_Orçamento1_idx (Orçamento_idOrçamento ASC),
  INDEX fk_Cliente_has_Orçamento_Cliente1_idx (Cliente_idCliente ASC),
  CONSTRAINT fk_Cliente_has_Orçamento_Cliente1
    FOREIGN KEY (Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Cliente_has_Orçamento_Orçamento1
    FOREIGN KEY (Orçamento_idOrçamento)
    REFERENCES Orçamento (idOrçamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Oficina_mecanica_Equipe
-- -----------------------------------------------------
CREATE TABLE Oficina_mecanica_Equipe (
  Oficina_mecanica_idOficina_mecanica INT NOT NULL,
  Equipe_idEquipe INT NOT NULL,
  PRIMARY KEY (Oficina_mecanica_idOficina_mecanica, Equipe_idEquipe),
  INDEX fk_Oficina_mecanica_has_Equipe_Equipe1_idx (Equipe_idEquipe ASC),
  INDEX fk_Oficina_mecanica_Equipe_Oficina_mecanica_idx (Oficina_mecanica_idOficina_mecanica ASC),
  CONSTRAINT fk_Oficina_mecanica_Equipe_Oficina_mecanica
    FOREIGN KEY (Oficina_mecanica_idOficina_mecanica)
    REFERENCES Oficina_mecanica (idOficina_mecanica)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Oficina_mecanica_has_Equipe_Equipe1
    FOREIGN KEY (Equipe_idEquipe)
    REFERENCES Equipe (idEquipe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Tabela_mão_obra
-- -----------------------------------------------------
CREATE TABLE Tabela_mão_obra (
  idTabela_mão_obra INT NOT NULL,
  valor_mão_obra FLOAT NOT NULL,
  serviço_realizado VARCHAR(45) NOT NULL,
  peças_usadas VARCHAR(45) NOT NULL,
  PRIMARY KEY (idTabela_mão_obra));


-- -----------------------------------------------------
-- Tabela Tabela_mão_obraOrçamento
-- -----------------------------------------------------
CREATE TABLE Tabela_mão_obraOrçamento (
  Tabela_mão_obra_idTabela_mão_obra INT NOT NULL,
  Orçamento_idOrçamento INT NOT NULL,
  PRIMARY KEY (Tabela_mão_obra_idTabela_mão_obra, Orçamento_idOrçamento),
  INDEX fk_Tabela_mão_obra_Orçamento_Orçamento1_idx (Orçamento_idOrçamento ASC),
  INDEX fk_Tabela_mão_obra_Orçamento_Tabela_mão__obra_idx (Tabela_mão_obra_idTabela_mão_obra ASC),
  CONSTRAINT fk_Tabela_mão_obra_Orçamento_Tabela_mão__obra
    FOREIGN KEY (Tabela_mão_obra_idTabela_mão_obra)
    REFERENCES Tabela_mão_obra (idTabela_mão_obra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Tabela_mão_obra_Orçamento_Orçamento1
    FOREIGN KEY (Orçamento_idOrçamento)
    REFERENCES Orçamento (idOrçamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Serviço
-- -----------------------------------------------------
CREATE TABLE Serviço (
  idServiço INT NOT NULL,
  nome_serviço VARCHAR(45) NOT NULL,
  valor_serviço VARCHAR(45) NOT NULL,
  PRIMARY KEY (idServiço));


-- -----------------------------------------------------
-- Tabela Ordem_Serviço_Serviço
-- -----------------------------------------------------
CREATE TABLE Ordem_Serviço_Serviço (
  Ordem_Serviço_idOrdem_Serviço INT NOT NULL,
  Serviço_idServiço INT NOT NULL,
  PRIMARY KEY (Ordem_Serviço_idOrdem_Serviço, Serviço_idServiço),
  INDEX fk_Ordem_Serviço_Serviço_Serviço1_idx (Serviço_idServiço ASC),
  INDEX fk_Ordem_Serviço_Serviço_Ordem_Serviço1_idx (Ordem_Serviço_idOrdem_Serviço ASC),
  CONSTRAINT fk_Ordem_Serviço_Serviço_Ordem_Serviço1
    FOREIGN KEY (Ordem_Serviço_idOrdem_Serviço)
    REFERENCES Ordem_Serviço (idOrdem_Serviço)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Ordem_Serviço_Serviço_Serviço1
    FOREIGN KEY (Serviço_idServiço)
    REFERENCES Serviço (idServiço)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Tabela Serviço_mão_obra
-- -----------------------------------------------------
CREATE TABLE Serviço_mão_obra (
  Serviço_idServiço INT NOT NULL,
  Tabela_mão_obra_idTabela_mão_obra INT NOT NULL,
  PRIMARY KEY (Serviço_idServiço, Tabela_mão_obra_idTabela_mão_obra),
  INDEX fk_Serviço_Tabela_mão_obra_Tabela_mão_obra1_idx (Tabela_mão_obra_idTabela_mão_obra ASC),
  INDEX fk_Serviço_has_Tabela_mão_obra_Serviço1_idx (Serviço_idServiço ASC),
  CONSTRAINT fk_Serviço_has_Tabela_mão_obra_Serviço1
    FOREIGN KEY (Serviço_idServiço)
    REFERENCES Serviço (idServiço)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Serviço_Tabela_mão_obra_Tabela_mão_obra1
    FOREIGN KEY (Tabela_mão_obra_idTabela_mão_obra)
    REFERENCES Tabela_mão_obra (idTabela_mão_obra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
  

