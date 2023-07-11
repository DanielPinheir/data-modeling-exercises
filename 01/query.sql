--create categoy table
create table categorias (
	id serial primary key,
  nome varchar(50) not null
)

--create products table
create table produtos (
  id serial primary key, 
  nome varchar(100) not null,
  descricao text,
  preco integer,
  quantidade_em_estoque integer,
  categoria_id integer references categorias(id)
);

--create table clients
create table clientes (
	cpf char(11) not null,
  nome varchar(150) not null
);

--create table sales
create table vendedores (
	cpf char(11) not null,
  nome varchar(150) not null
);

--add constraint unique in client and sales tables
alter table clientes add constraint unique_cpf unique(cpf);
alter table vendedores add constraint unique_cpf_vendedores unique(cpf);

--create order table
create table pedidos (
  id serial primary key, 
  valor integer,
  cliente_cpf char(11) references clientes(cpf),
  vendedor_cpf char(11) references vendedores(cpf)
);

--create order intens table
create table itens_do_pedido (
	id serial primary key,
  pedido_id integer references pedidos(id),
  quantidade integer,
  produto_id integer references produtos(id)
)



