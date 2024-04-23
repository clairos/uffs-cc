## Atividades Postgres Objects

No WSL, dentro do diretório raíz, necessário os seguintes comandos para criar as pastas onde serão criadas as tablespaces:

```
cd /

pwd

mkdir tbs

cd tbs

mkdir tbs01
mkdir tbs02

cd /

sudo chown -R postgres:postgres /tbs/ 

sudo -i -u postgres psql
```

---

#### 1. Criando TABLESPACES

```sql
CREATE TABLESPACE tbs01 LOCATION '/tbs/tbs01';
CREATE TABLESPACE tbs02 LOCATION '/tbs/tbs02';
```

#### 2. Criando USERS

```sql
CREATE USER clara1 PASSWORD 'clara1';
CREATE USER clara2 PASSWORD 'clara2';
```

Também coloquei permissão de super user para o usuário clara1

```sql
ALTER USER clara1 WITH SUPERUSER;
```

#### 3. Criando um banco de dados utilizando uma das tablespaces criadas como default, no esquema criado

```sql
CREATE DATABASE mydb TABLESPACE tbs01;
```

#### 4. Alterando o dono do BD para um dos usuários criados

```sql
ALTER DATABASE mydb OWNER TO clara1;
```

#### 5. Acessando o BD como usuário 

```sql
\c mydb clara1
```

#### 6. Cria SCHEMA 

```sql
CREATE SCHEMA desenv;
```

#### 7. Apontando o esquema como padrão para o banco e para o usuário

```sql
ALTER DATABASE mydb SET search_path TO desenv;
```

```sql
ALTER USER clara1 SET search_path TO desenv;
```

#### 8. Criando o script do banco de dados utilizado em aulas anteriores (produto x venda)
```sql
CREATE TABLE product (					
	pid integer not null primary key,				
	name varchar(30) not null,					
	pqty  integer not null);

CREATE TABLE sale (
   sid integer not null primary key,
   sdate date not null,
   address varchar(30));
   
CREATE TABLE sale_item (
	sid integer not null,
	pid integer not null,
	sqty integer not null,
	CONSTRAINT pk_sale_item PRIMARY KEY (sid,pid),
	CONSTRAINT fk_sale_item_sale FOREIGN KEY (sid) REFERENCES sale(sid),
	CONSTRAINT fk_sale_item_product FOREIGN KEY (pid) REFERENCES product(pid)
);
```

#### 9. Populando e o BD com os scripts implementados em sala de aula (1000 produtos, 500 cupons e +1000 produtos vendidos)

Criação das procedures para inserção nas tabelas product, sale e sale_item:

```sql
CREATE OR REPLACE PROCEDURE ins_product(qttup int) LANGUAGE plpgsql
AS $$
DECLARE
   prd_tup product%rowtype;
   counter int:=0;
   stock int[5]:='{3,5,8,10,15}';
BEGIN
   RAISE NOTICE 'Range ids: %',100*qttup;
   LOOP
      prd_tup.pid:=(random()*100*qttup)::int;
      prd_tup.name:=left(MD5(random()::text),20);
      prd_tup.pqty:=stock[(random()*4)::int+1];
      RAISE NOTICE 'product: %',prd_tup;
      IF (NOT EXISTS (SELECT 1 FROM product WHERE pid=prd_tup.pid))
      THEN
        INSERT INTO product (pid,name,pqty) VALUES (prd_tup.pid,prd_tup.name,prd_tup.pqty);
        counter:=counter+1;
      END IF;
      EXIT WHEN counter >= qttup;
   END LOOP;
END; $$;


CREATE OR REPLACE PROCEDURE ins_sale(qttup int) LANGUAGE plpgsql
AS $$
DECLARE
   sale_tup sale%rowtype;
   counter int:=0;
BEGIN
   RAISE NOTICE 'Range ids: %',100*qttup;
   LOOP
      sale_tup.sid:=(random()*100*qttup)::int;
      sale_tup.sdate:='2023-01-01 00:00:00'::timestamp + random()*(now()-timestamp '2023-01-01 00:00:00');
      RAISE NOTICE 'Sale: %',sale_tup;
      IF (not exists (SELECT 1 FROM sale WHERE sid=sale_tup.sid))
      THEN
        INSERT INTO sale (sid,sdate) VALUES (sale_tup.sid,sale_tup.sdate);
        counter:=counter+1;
      END IF;
      EXIT WHEN counter >= qttup;
   END LOOP;
END; $$;

CREATE OR REPLACE PROCEDURE ins_sale_item (qttup int) language plpgsql
AS $$
DECLARE
    itBySale int[6]:='{2,4,7,8,9,10}';
    nprod int;
    counter_nprod int := 0;
    sale_item_tup sale_item%rowtype;
    array_prod int[];
    array_sale int[];
    qt_prod int;
    qt_sale int;
    counter int:=0;
BEGIN
    SELECT array_agg(pid) INTO array_prod FROM product;
    SELECT count(pid) INTO qt_prod FROM product;
    SELECT array_agg(sid) INTO array_sale FROM sale;
    SELECT count(sid) INTO qt_sale FROM sale;
    nprod := itBySale[(random()*5+1)::int+1];
    LOOP
        sale_item_tup.sid := array_sale[(random()*(qt_sale-1))::int+1];
            LOOP
                sale_item_tup.pid := array_prod[(random()*(qt_prod-1))::int+1];
                sale_item_tup.sqty := (random()*1000)::int;
                
                IF (NOT EXISTS (SELECT 1 FROM sale_item WHERE sid=sale_item_tup.sid AND pid=sale_item_tup.pid))
                    THEN
                    INSERT INTO sale_item (sid, pid, sqty) VALUES (sale_item_tup.sid, sale_item_tup.pid, sale_item_tup.sqty);
                    counter_nprod := counter_nprod + 1;
                END IF;
                EXIT WHEN counter_nprod > nprod;
            END LOOP;
            counter := counter +1;
        EXIT WHEN counter >= qttup;
    END LOOP;
END; $$;
```

Procedure call_all:
```sql
CREATE OR REPLACE PROCEDURE call_all (qtprod int, qtsale int, qtitem int) LANGUAGE plpgsql
AS $$
BEGIN
   call ins_product(qtprod);
   call ins_sale(qtsale);
   call ins_sale_item(qtitem);
END; $$;
```

Populando o banco:
```sql
CALL call_all(1000, 500, 1100);
```

#### 10. Criando uma trigger que armazene em uma tabela de auditoria todas as vezes que a quantidade vendida de um produto for alterada (ou uma venda de produto for excluída)
> A tabela de auditoria deverá ter a operação, o valor antigo e novo (se for o caso), data e hora da operação e usuário. Esta tabela não tem PK.

```sql
CREATE OR REPLACE FUNCTION audit_trigger() RETURNS TRIGGER AS $$
DECLARE
    operation_text TEXT;
    old_quantity INTEGER;
    new_quantity INTEGER;
BEGIN
    IF (TG_OP = 'INSERT') THEN
        operation_text := 'INSERT';
    ELSIF (TG_OP = 'UPDATE') THEN
        operation_text := 'UPDATE';
        old_quantity := OLD.sqty; 
        new_quantity := NEW.sqty; 
    ELSIF (TG_OP = 'DELETE') THEN
        operation_text := 'DELETE';
    END IF;

    INSERT INTO audit (operation, old_quantity, new_quantity, operation_time, user_name)
    VALUES (operation_text, old_quantity, new_quantity, current_timestamp, current_user);

    RETURN NULL; 
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER audit_trigger
AFTER INSERT OR UPDATE OR DELETE ON sale_item
FOR EACH ROW EXECUTE FUNCTION audit_trigger();
```

###### Para testar:

1. Inserção de um novo registro na tabela 'sale_item':
```sql
INSERT INTO sale_item (sid, pid, sqty) VALUES (1, 1, 10);
```

2. Atualização da quantidade vendida em um registro existente:
```sql
UPDATE sale_item SET sqty = 15 WHERE sid = 1 AND pid = 1;
```

3. Exclusão de um registro da tabela 'sale_item':
```sql
DELETE FROM sale_item WHERE sid = 1 AND pid = 1;
```

###### Agora só verificar a tabela de auditoria:
```sql
SELECT * FROM audit;
```

#### 11. Criando um índice não único para a data da venda e, neste índice, incluindo o endereço.

```sql
CREATE INDEX idx_sale_date_address ON sale (sdate, address);
```

#### 12. Para o usuário não dono do BD, dando alguns privilégios: SELECT em product e sale, todos para sale_item.

```sql
GRANT SELECT ON TABLE product TO clara2;
```

```sql
GRANT SELECT ON TABLE sale TO clara2;
```

```sql
GRANT ALL ON TABLE sale_item TO clara2;
```