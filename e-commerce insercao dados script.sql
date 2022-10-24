-- inserção de dados e quaries
use ecommerce;

show tables;
-- Table clients
-- idClient, Fname, Minit, Lname, CPF, address

insert into clients (Fname, Minit, Lname, CPF, address) values
	('Maria','M','Silva',12345678912,'Rua Silva Bueno 29, Caranbola - Cidade das Flores'),
    ('Antonio','J','Souza',65425878965,'Av das Borboletas 1201, Porai - Cidade Bauru'),
    ('Ricardo','G','Gomes',78945632112,'Rua das Fontes 365, Jd das Hortencias - Cidade Suzano'),
    ('Juliana','M','Ladeira',14785236945,'Rua Leite, Jd das Oliveiras - Cidade São Paulo'),
    ('Roberta','G','Assis',25645274598,'Rua das Palmas 478, Santana - Cidade São Paulo'),
    ('João','D','Silva',36985214758,'Rua Moraes 269, Vila Velha - Cidade Ilhéus'),
    ('Francisca','A','Gjuimarães',84596574521,'Rua Santo Amaro 698, Centro - Cidade São Paulo'),
    ('Isabela','M','França',75395145625,'Rua Flores 1452, Ipanema - Cidade Rio de Janeiro');

select * from clients;

-- Table companys   -  cliente pessoa jurídica

insert into companys (SocialName, abstName, CNPJ, address) values
	('Chapeleiro Maluco Ltda','Maluco',36456214000180,'Av Interlagos 1269 - Interlagos - São Paulo'),
    ('Sonho Ltda','Sonho','Sonho','65124333000174','Av Nações Unidas 12080 - Morumbi - São Paulo'),
    ('Banco Lelé S.A.','Lelé',1245987000125,'Av Paulista 1274 - Cerqueira Cesar - São Paulo'),
    ('Eletronica Brila Ltda','Brilha',2456789000266,'Av Brasil 3659 - Copacabana - Rio de Janeiro'),
    ('Pastel Come Tudo Ltda','Come Tudo',3412365000141,'Rua das Abelhas 33 - Jd Souza - Belo Horizonte'),
    ('Óculo Olha Mais Ltda','Olha Mais',45789147000165,'Av Cajamar 56 - Jd Olivia - Porto Alegre');

select * from companys;

-- Table product
-- idProduct, Pname, classification_kids bollean, category('Eletrônico','Eletrodoméstico','Vestimenta','Brinquedos','Alimentos','Movéis')

insert into product (Pname, classification_kids, category, avaliacao, size) values
	('Fone de ouvido',false,'Eletrônico',4,null),
    ('Barbie',true,'Brinquedos',3,null),
    ('Body Cartrs',true,'Vestimenta',5,null),
    ('Microfone Vedo - Youtuber',false,'Eletrônico',4,null),
    ('Sofá Retratil',false,'Móveis',3,'3x57x80'),
    ('Farinha de arroz',false,'Alimentos',2,null),
    ('Robo dançarino',true,'Brinquedos',5,null),
    ('Mesa de Jantar',false,'Movéis',4,'2x3x2'),
    ('Leite integral',false,'Alimentos',4,null),
    ('Fire Stick Amazon',false,'Eletrônico',3,null);
 
 select * from product;
 
-- Table orders
-- idOrder, idOrderClient, orderStatus, orderDescreption, sendValue, paymentCash

insert into orders (idOrderClient, orderStatus, orderDescreption, sendValue, paymentCash) values
	(1,null,default,'compra via aplicativo',null,1),
    (2,null,default,'compra via aplicativo',50,0),
    (3,null,'confirmado',null,null,1),
    (4,null,default,'compra via web',150,0),
    (null,1,default,'compra via web',250,1),
    (null,4,'Confirmado','compra pela internet',150,0),
    (null,5,default,'compra via web',90,0),
    (null,6,'Confirmado','compra via web',110,0);
    
select * from orders;
    
-- Table productOrder
-- idPOproduct, idOPorder, poQuantity, poStatus

insert into productOrder (idPOproduct, idOPorder, poQuantity, poStatus) values
	(1,5,2,null),
    (2,5,1,null),
    (3,6,1,null);
    
select * from productOrder;
    
-- Table productStorage

insert into productStorege (storageLocation,quantity) values
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasilia',60);
    
select * from productStorage;
    
-- Table storageLocation

insert into storageLocation (idLproduct, idLstorage, location) values
	(1,2,'RJ'),
    (2,6,'GO');
    
select * from storageLocation;
    
-- Table supplier

insert into supplier (SocialName, CNPJ, contact) values
	('Almeida e Filhos',12456789000122,'21985474'),
    ('Eletrônicos Silva',99333444000166,'21985496'),
    ('Eletrônicos Valma',934567890002-63,'21975474');
    
select * from supplier;
    
-- Table productSipplier

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
	(1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);
    
select * from productSupplier;
    
-- Table seller

insert into seller (socialName, AbstName, CNPJ, CPF, location, contact) values
	('Tech Eletronics',null,88999444000171,null,'Rio de Janeiro',219946287),
    ('João da Silva',null,null,55566644400,'Belo Horizonte',2195647895),
    ('Kids World',null,45623412000156,null,'São Paulo',1198657484);
    
select * from seller;

-- Table payments (idPyClient, idPyCompany, typePayment['Boleto','Cartão','Dois cartões'], numCartao, numCartao2, dateValid

insert into payments (idPyClient, idPyCompany, typePayment, numCartao, numCartao2, dateValid) values
	(1,null,'Boleto',null,null,null),
    (2,null,'Cartão',4555444433336666,null,'2028-05-25'),
	(3,null,'Cartão',4569789412362587,null,'2026-12-30'),
    (3,null,'Dois cartões',null,5555666633224141,'2024-04-20'),
    (4,null,'Cartão',4756987445613214,null,'2024-06-30'),
    (null,1,'Boleto',null,null,null),
    (null,4,'Cartão',4652696365478524,null,'2025-08-26'),
    (null,5,'Cartão',5698444456562525,null,'2023-11-26'),
    (null,6,'Cartão',4612637896324521,null,'2022-10-15');
	
select * from payments;

-- Table productSeller

insert into productSeller (idPseller, idPproduct, prodQiuantity) values
	(1,6,80),
    (2,7,10);

--  Queries

use ecommerce;

select count(*) from clients;

select * from clients c, orders o where c.idClient = idOrderClient;

select concat(Fname, ' ', Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select count(*) from clients c, orders o where c.idClient = idOrderClient;

select * from clients left outer join orders on idClient = idOrderClient;

-- recuperar quantos pedidos foram realizados pelos clientes?
desc product;

select c.idClient, Fname, count(*) as Number_of_orders from clients c
inner join orders o on c.idClient = o.idOrderClient
inner join product p on p.idProduct = o.idOrder
group by c.idClient;

-- Ver quantidades de pedidos de clientes PJ:
select idCompany, socialName as Razao_Social, count(*) as Numeros_de_pedidos from companys
inner join orders on idCompany = idOrderCompany
inner join product on idProduct = idOrder
group by idCompany;

-- Verificando os clientes PF ordenados
select idClient, concat(Fname,' ',Minit,' ',Lname) as Nome_Cliente, CPF
from clients order by Fname;

-- Verificando os clientes PJ ordenados
select idCompany, socialName as Razao_Social, CNPJ
from companys order by socialName;

-- verificando tipo de pagamento dos clientes
-- PF
select idClient, concat(Fname,' ',Minit,' ',Lname) as Nome_Cliente, typePayment as Tipo_pagamento
from clients inner join payments on idPyClient = idClient
order by Fname;

-- PJ
select idCompany, socialName as Razao_Social, typePayment as Tipo_pagamento
from companys inner join payments on idPyCompany = idCompany
order by socialName;

-- Contando pagamentos por clientes

select idcompany, socialName as Razão_Social, count(*) as Qtde_de_Pagamento
from companys, payments where idcompany = idPyCompany
group by CNPJ
order by socialName;

select * from payments;

select idclient, concat(Fname,' ',Lname) as Nome, count(*) as Qtde_Pagto
from clients, payments where idClient = idPyClient
group by CPF
order by Fname;

select * from clients join orders on idclient = idOrderClient;
select * from companys join orders on idCompany = idOrderCompany;


-- Verificar o status do pedido

select socialName as Nome_empresa, Address, orderStatus as Status
from (companys join orders on idCompany = idOrderCompany)
where orderStatus = 'Em Processamento';

select concat(Fname,' ',Lname) as Nome, Address, orderStatus as Status
from (clients join orders on idClient = idOrderCompany)
where orderStatus = 'Em Processamento';

-- verificar as compras e status dos pedidos de clientes

select idClient, concat(Fname,' ',Lname) as Nome, Pname as Produto, category as Categoria, orderStatus as Status_pedido
from product
inner join (productorder inner join orders on idPOorder = idOrder) on idProduct = idPOproduct
inner join clients on idClient = idOrderClient;

select * from (clients, product)
inner join orders on idClient = idOrderClient
inner join productorder on idProduct = idPOproduct or idPOorder = idOrder;


select * from product;
select * from orders;
select * from productorder;

use ecommerce;

select Fname, CPF, Address, orderStatus, orderDescription
from (clients join orders on idOrderClient = idClient)
where orderStatus = 'Confirmado';

select * from clients join payments on idPyClient = idClient;

select * from clients
inner join orders on idOrderClient = idClient
inner join productorder on idPOorder = idOrder
inner join product on idProduct = idPOproduct
where idPOorder = idOrder and idProduct = idPOproduct;

select * from supplier;
select * from productstorage;
select * from productseller;
select * from storagelocation;
select * from product;

select Pname, category, avaliacao, storageLocation, quantaty
from product
inner join productstorage on idProdStorage = idProduct
having quantaty > 499;



