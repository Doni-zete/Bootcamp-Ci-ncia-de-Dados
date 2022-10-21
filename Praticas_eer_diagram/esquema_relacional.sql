-- criação do banco de dados para cenario E-commerce


 -- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela cliente;

CREATE TABLE clientes(
	idCliente int auto_increment primary key,
    nome varchar(10),
    Minit char(3),
    sobrenome varchar(20),
    cpf char(11) not null,
    endereco varchar(30),
    constraint unique_cpf_cliente unique(cpf)
);


desc clientes;

-- Criar tabela produto
CREATE TABLE produtos(
	idProduto int auto_increment primary key,
    nome_produto varchar(10) not null,
    classificação_criança bool,
    categoria enum('Eletronico', 'Vestimento', 'Brinquedos','Alimentos') not null,
    avaliação float default 0,
    valor float,
    size varchar(10)
    
);

desc produtos;

-- Criação tabela pagamento
CREATE TABLE pagamentos(
	idCliente int,
	idPagamento int,
	tipo_pagamento enum('Boleto','Cartão','Dois cartões','pix'),
	avaliação_limite float,
	primary key(idCliente, idPagamento)
);


-- Criar tabela ordens

CREATE TABLE ordens(
	IdOrdem int auto_increment primary key,
    idCliente int, 
    ordem_status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    ordem_descrição varchar(255),
    valor_enviado float default 10,
    pagamento_cash bool default false,
    constraint fk_ordens_cliente foreign key(idCliente) references clientes(idCliente)
			
);

desc ordens;

-- Criar tabela estoque
CREATE TABLE Produtoestoque(
	idProduto_estoque int auto_increment primary key,
    local_estoque varchar(255),
    quantidade int default 0
);

-- Criar tabela fornecedore

CREATE TABLE  fornecedores(
	idFornecedor int auto_increment primary key,
    razão_social varchar(250) not null,
    cnpj char(15) not null,
    contato char(11) not null,
    constraint unique_fornecedores unique(cnpj)
);

desc fornecedores;

-- Criação tabela vendedor
CREATE TABLE  vendedores(
	idVendedor int auto_increment primary key,
    razão_social varchar(250) not null,
    cnpj char(15),
    cpf char(15),
    contato char(11) not null,
    constraint unique_cnpj_vendedor unique(cnpj),
    constraint unique_cpf_vendedor unique(cpf)
);
desc vendedores;

CREATE TABLE Produtovendedor(
idProdutovendedor int,
idPproduto int,
quantidade_produto int default 1,
primary key (idProdutovendedor, idPproduto),
constraint fk_produtos_vendedores foreign key(idProdutovendedor) references vendedores(idVendedor),
constraint fk_produtos_produtos foreign key(idPproduto) references produtos(idProduto)
);

desc Produtovendedor;

CREATE TABLE Ordemproduto(
	idOrdem_produto int,
    idOrdem_prodtuto_ordem int,
    ordem_produto_quantidade int default 1,
    ordem_produto_status enum('Disponivel','Sem estoque')default 'Disponivel',
    primary key(idOrdem_produto,idOrdem_prodtuto_ordem),
    constraint fk_vendedor_produto foreign key (idOrdem_produto) references produtos(idProduto),
    constraint fk_produto_produto foreign key (idOrdem_prodtuto_ordem) references ordens(IdOrdem)
);

desc Ordemproduto;

CREATE TABLE Localestoque(
Idlocal_produto int,
idlocal_estoque int,
local varchar (255) not null,
primary key  (Idlocal_produto,idlocal_estoque),
constraint fk_local_estoque_produto foreign key (Idlocal_produto) references produtos(idProduto),
constraint fk_local_estoque_estoque foreign key (idlocal_estoque) references produtoestoque(idProduto_estoque)
);

CREATE TABLE Fornecedorproduto(
idFornecedor_produto int,
idFornecedor int,
quantidade int not null,
primary key(idFornecedor_produto,idFornecedor),
constraint fk_produto_forncedor_fornecedor  foreign key (idFornecedor) references fornecedores(idFornecedor),
constraint fk_produto_fonecedor_produto foreign key(idFornecedor_produto) references produtos(idProduto)
);

show tables;