-- Criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente PF

create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)	
);

-- criar tabela cliente PJ

create table companys(
	idCompany int auto_increment primary key,
    socialName varchar(45) not null,
    abstName varchar(10),
    CNPJ char(13) not null,
    address varchar(255),
    constraint unique_cnpj_company unique (CNPJ)
);

alter table companys MODIFY COLUMN CNPJ char(14) not null;

-- criar tabela produto
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônica','Eletrodoméstico','Vestimenta','Brinquedos','Alimentos','Movéis') not null,
    avaliacao float default 0,
    size varchar(10)
);

alter table product modify column Pname varchar(20) not null;


-- criar constraint relacionadas aos pagamentos

drop table payments;

create table payments(
	idPyClient int,
    idPyCompany int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    numCartao char(16),
    numCartao2 char(16),
	dateValid date,
    constraint fk_payments_client foreign key (idPyClient) references Clients(idClient),
    constraint fk_payments_company foreign key (idPyCompany) references companys(idCompany)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    idOrderCompany int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_order_clients foreign key (idOrderClient) references clients (idClient),
    constraint fk_order_companys foreign key (idOrderCompany) references companys (idCompany)
);

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(45),
    quantaty int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(45) not null,
    CNPJ char(13) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier MODIFY COLUMN CNPJ char(14) not null;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(45) not null,
    abstName varchar(10),
    CNPJ char(13),
    CPF char(11),
    Location varchar(255),
    contact char(11) not null,
    constraint unique_seller_cnpj unique (CNPJ),
    constraint unique_seller_cpf unique (CPF)
);

use ecommerce;

alter table seller modify column CNPJ char(14);

-- criar tabela produto / vendedor
create table productSeller(
	idPseller int,
    idProduct int,
    proQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(IdProduct)
);

-- criar tabela produto / pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_seller_PO foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product_PO foreign key (idPOorder) references orders(idOrder)
);

-- criar tabela produto em estoque
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_product_product_SL foreign key (idLproduct) references product(idProduct),
    constraint fk_product_storage_SL foreign key (idLstorage) references productStorage(idProdStorage)
);

-- criar tabela produto / fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

use ecommerce;





