--Atividade 2
-- 1 Crie um relatório que mostre todos os pedidos, itens, nome dos - clientes e nome das pizzas.
CREATE VIEW vw_relatorio_pedidos AS
SELECT
    p.pedido_id,
    p.data,
    p.hora,
    c.nome AS cliente,
    pi.nome AS pizza,
    ip.quantidade,
    ip.valor AS preco_unitario,
    ip.valor * ip.quantidade AS subtotal
FROM Pedidos AS p JOIN Clientes AS c ON c.cliente_id = p.cliente_id
LEFT JOIN Itens_Pedido AS ip ON ip.pedido_id = p.pedido_id
LEFT JOIN Pizzas AS pi ON pi.pizza_id = ip.pizza_id;

-- 2 Acrescente uma coluna chamada subtotal que seja o calculo do preco - unitário da pizza vezes a quantidade
CREATE VIEW vw_total_pedidos AS
SELECT
    p.pedido_id,
    p.data,
    p.hora,
    c.nome AS cliente,
    SUM(ip.valor * ip.quantidade) AS subtotal
FROM Pedidos p INNER JOIN Clientes c ON c.cliente_id = p.cliente_id
LEFT JOIN Itens_Pedido ip ON ip.pedido_id = p.pedido_id
GROUP BY p.pedido_id, p.data, p.hora, c.nome;

-- 3 Agrupe os pedidos e calcule o valor total
CREATE VIEW vw_quantidade_pizzas_pedidos AS
SELECT
    p.pedido_id,
    p.data,
    p.hora,
    c.nome AS cliente,
    SUM(ip.quantidade) AS total
FROM Pedidos p
INNER JOIN Clientes c ON c.cliente_id = p.cliente_id
LEFT JOIN Itens_Pedido ip ON ip.pedido_id = p.pedido_id
GROUP BY p.pedido_id, p.data, p.hora, c.nome;

-- 4 Agrupe os pedidos e conte quantas pizzas cada pedido possui
SELECT * FROM relatorio_pedidos;
SELECT * FROM total_pedidos;
SELECT * FROM quantidade_pizzas_pedidos;