-- inserção de dados e queries

use ecommerce;
show tables;
-- idCliente, nome, minit, sobrenome, cpf, endereço
insert into clientes(nome, minit, sobrenome, cpf, endereco)
	values('Maria','M','Silva',12346789, 'rua silva preta 29, Crangola -Cidade das flores'),
    ('Matheus', 'O', 'Pimenta', 987654321, 'rua alameda 289, Centro - Cidade das florestas');
    
-- idProduto, nome, classificação_criança, categoria,('Eletronico', Vestimento, Alimento) avaliação, size    
insert into produtos(nome_produto, classificação_criança, categoria, avaliação,size)
	values('Barbie Elsa', true,'Eletronico', '3',null),
			('Fone de ouvido', true,'Boneca', '4',null);
            
            
insert into ordens(idCliente, ordem_status, ordem_descrição, valor_enviado,pagamento_cash)
	values(1,default ,'compra via aplicativo',null,1 ),
			(2,default,'compra via aplicativo',50,0 );
            
            
insert into Ordemproduto(idOrdem_produto,idOrdem_prodtuto_ordem,ordem_produto_quantidade,ordem_produto_status)   
  values(1,5,2,null),
		(2,5,1,null),
		(1,6,1,null);
        
insert into Produtoestoque(local_estoque,quantidade)
value('Rio de janeiro',1000),
('São paulo',5000);


insert into Localestoque(Idlocal_produto,idlocal_estoque,local)
values(1,2,'RJ'),
	(2,2,'GO');
    
insert into fornecedores(razão_social,cnpj,contato)    
values('Almeida e filhos', 12345678910,'2191620032'),
('Play tecnologi',854519649143457,'45985487');


insert into Fornecedorproduto(idFornecedor_produto,idFornecedor,quantidade)
values(1,1,500),
(1,2,509);

insert into vendedores(idVendedor,razão_social,cnpj,cpf,contato)values
('Tech eletronics',null, 123456789456321,null,219946287),
('Botique donam',null,456789123654485,123456783,'219867892');


insert into Produtovendedor(idProdutovendedor,idPproduto,quantidade_produto)
values(3,1,80),
(4,2,10);
			
            
            
delete from vendedores; 
select * from clientes;
select * from produtos;
select * from ordens;
select * from Ordemproduto;
select * from Produtoestoque;
select * from Localestoque;
select * from fornecedores;
select *from Fornecedorproduto;
select * from vendedores;
select * from Produtovendedor;

select count(*) from clientes;

select * from clientes c, ordens o where c.idCliente = idOrde;

select * from clientes c, ordens o
where c.idcliente = idOrdemcliente;

