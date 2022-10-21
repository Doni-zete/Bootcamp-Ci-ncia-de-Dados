-- inserção de dados e queries

use ecommerce;
show tables;
-- idCliente, nome, minit, sobrenome, cpf, endereço
insert into clientes(nome, minit, sobrenome, cpf, endereco)
	values('Maria','M','Silva',12346789, 'rua silva preta 29, Crangola -Cidade das flores'),
		  ('Matheus', 'O', 'Pimenta', 987654321, 'rua alameda 289, Centro - Cidade das florestas'),
          ('Vitor', 'O', 'Pimenta', 997654321, 'rua alameda 289, Centro - Cidade das florestas'),
          ('Ana', 'O', 'Clara', 887654321, 'rua alameda 282, Centro - Cidade das florestas');
    
    
-- idProduto, nome, classificação_criança, categoria,('Eletronico', Vestimento, Alimento) avaliação, size    
insert into produtos(nome_produto, classificação_criança, categoria, avaliação,size)
	values('Barbie Elsa', true,'Eletronico', '3',null),
		  ('Camisa', true,'Vestimento', '5',null),
		  ('Fone de ouvido', true,'Eletronico', '4',null);
            
            
insert into ordens(idCliente, ordem_status, ordem_descrição, valor_enviado,pagamento_cash)
	values(1,default ,'compra via aplicativo',null,1 ),
		  (2,default,'compra via aplicativo',20,0 ),
		  (3,'Confirmado',null,null,1 ),
		  (4,null,'compra via web site',150,0);
            
          
            
            
insert into Ordemproduto(idOrdem_produto, idOrdem_prodtuto_ordem, ordem_produto_quantidade,ordem_produto_status)   
  values(1,1,2,null),
		(2,1,1,null),
		(3,2,1,null);
        
        
insert into Produtoestoque(local_estoque,quantidade)
value('Rio de janeiro',1000),
	 ('São paulo',5000),
	 ('São paulo',2000);


insert into Localestoque(Idlocal_produto,idlocal_estoque,local)
values(1,2,'RJ'),
	  (2,2,'GO');
    
insert into fornecedores(razão_social,cnpj,contato)    
values('Almeida e filhos', 12345678910,'2191620032'),
	  ('Play tecnologi',554519649143457,'45985487'),
      ('Girão empresario',854519649143457,'45985487');



insert into Fornecedorproduto(idFornecedor_produto, idFornecedor, quantidade)
values(1,1,500),
	  (1,2,400),
      (2,4,633),
      (3,3,5),
      (2,5,10);


insert into vendedores(idVendedor,razão_social,cnpj,cpf,contato)values
('Tech eletronics',null, 123456789456321,null,219946287),
('Botique donam',null,456789123654485,123456783,'212867892'),
('Mundo das crianças',null,26789123654485,113456783,'199867892');



insert into Produtovendedor(idProdutovendedor,idPproduto,quantidade_produto)
values(3,1,80),
      (4,2,10);
			
            
            


