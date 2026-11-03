--Atividade 1
-- A Quantas tabelas o banco de dados possui?
show tables;

-- B Quantos Clientes cadastrados?
select count(*) as `total de clientes` from clientes;

-- C Quantas pizzas Cadastradas?
select count(*) as 'total de pizzas' from pizzas;

-- D Quantas pizzas o pedido nº 3 possui?
select sum(quantidade) as 'total de pizzas' from itens_pedido where pedido_id = 3;

-- E Qual nome do cliente que fez o pedido nº 3?
select c.nome as 'cliente do pedido 3' from pedidos p inner join clientes c on c.cliente_id = p.cliente_id where p.pedido_id = 3;

-- F Quais os nomes das pizzas do pedido nº 3?
select pizzas.nome as 'nome das pizzas do pedido 3' from pizzas inner join itens_pedido on pizzas.pizza_id = itens_pedido.pizza_id where itens_pedido.pedido_id = 3;

--Atividade 3
-- 1. Um novo cliente com os dados a seguir quer as seguintes pizzas:
insert into Clientes (nome, logradouro, numero, complemento, bairro, referencia) values
("Gaspar Oliveira","Rua Alcides Postali",21,null,"São Dima","Ao lado da igreja");
select * from clientes;

insert into telefones (cliente_id, telefone) values
(106, "19 99898-1141");

insert into Pedidos (cliente_id, data, hora, valor) values
(106, CURDATE(), CURTIME(), 40.00);

--2. Acrescente a pizza a seguir no cardápio:
insert into Pizzas(nome, descricao, valor) values
("A moda do chef", "Molho de tomate, palmito macio em rodelas, coberto com catupiry, frango desfiado, ovos, carne seca, oregano e azeitonas", 41.90);

--3. O cliente "Gaspar Oliveira" pediu duas pizzas "A moda do chef", registre seu pedido.
insert into pedidos(cliente_id, data, hora, valor) values
(106, CURDATE(), CURTIME(), 83.80);

insert into itens_pedido(pedido_id, pizza_id, quantidade, valor) values
(27, 42, 2, 41.90);

--4. Em tempo o cliente "Gaspar Oliveira" ligou e pediu para que seu pedido seja alterado para 3 pizzas "A moda do chef" e acrescentando uma pizza "Margherita" ao pedido.
update itens_pedido set quantidade = 3 where pedido_id = 27;
insert into itens_pedido(pedido_id, pizza_id, quantidade, valor) values
(27, 22, 1, 41.90);