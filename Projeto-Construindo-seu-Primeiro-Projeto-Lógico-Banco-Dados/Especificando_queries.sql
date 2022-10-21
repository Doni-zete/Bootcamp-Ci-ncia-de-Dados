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

select * from clientes c, ordens o where c.idCliente = IdOrdem;

select nome, sobrenome, idOrdem, ordem_status from clientes c, ordens o where c.idCliente =IdOrdem;

select  concat (nome, '' , sobrenome) as Clientes, idOrdem as ordem, ordem_status from clientes c, ordens o where c.idCliente =IdOrdem;

select  concat (nome, '' , sobrenome) as Clientes, idOrdem as ordem, ordem_status from clientes c, ordens o;


select * from clientes c, ordens o
	where c.idcliente = IdOrdem;
    
select * from clientes c
	inner join ordens o on c.idCliente = o.IdOrdem;

-- Retorna pedidos com produtos associados?
select * from clientes c
	inner join ordens o on c.idCliente = o.idCliente
    inner join ordemproduto op on op.idOrdem_produto = o.idCliente
    group by IdOrdem;

-- Retorna quantos pedidos foram feitos por cada cliente?
select c.idCliente, nome, count(*) as 'Numero de ordens' from clientes c
		inner join ordens o on c.idCliente = o.IdOrdem
		group by idCliente;
    
-- Relação de produtos fornecedores e estoques;   
select * from vendedores v 
	inner join fornecedores f on v.idVendedor = idVendedor
    where idVendedor = idFornecedor;
    
-- Relação de nomes dos fornecedores e nomes dos produtos;
select razão_social, nome_produto  from fornecedores f
	inner join 	Fornecedorproduto fp on  fp.idFornecedor_produto = fp.idFornecedor
	inner join produtos p on  fp.idFornecedor_produto = p.idProduto
	
	



