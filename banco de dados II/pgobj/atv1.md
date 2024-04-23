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

#### 1. Cria TABLESPACES

```sql
CREATE TABLESPACE tbs01 LOCATION '/tbs/tbs01';
CREATE TABLESPACE tbs02 LOCATION '/tbs/tbs02';
```

#### 2. Cria USERS

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

#### 5. Acessando o BD

```sql
\c mydb clara1
```

#### 6. Cria SCHEMA 

```sql
CREATE SCHEMA desenv;
```

<!-- ```sql
GRANT USAGE ON SCHEMA desenv TO clara1;
``` -->

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

Criação das procedures:
```sql
create or replace procedure ins_product(qttup int) Language plpgsql
as $$
declare
   prd_tup product%rowtype;
   counter int:=0;
   stock int[5]:='{3,5,8,10,15}';
begin
   raise notice 'Range ids: %',100*qttup;
   loop
      prd_tup.pid:=(random()*100*qttup)::int;
      prd_tup.name:=left(MD5(random()::text),20);
      prd_tup.pqty:=stock[(random()*4)::int+1];
      raise notice 'product: %',prd_tup;
      if (not exists (select 1 from product where pid=prd_tup.pid))
      then
        insert into product (pid,name,pqty) values (prd_tup.pid,prd_tup.name,prd_tup.pqty);
        counter:=counter+1;
      end if;
      exit when counter >= qttup;
   end loop;
end; $$;


create or replace procedure ins_sale(qttup int) Language plpgsql
as $$
declare
   sale_tup sale%rowtype;
   counter int:=0;
begin
   raise notice 'Range ids: %',100*qttup;
   loop
      sale_tup.sid:=(random()*100*qttup)::int;
      sale_tup.sdate:='2023-01-01 00:00:00'::timestamp + random()*(now()-timestamp '2023-01-01 00:00:00');
      raise notice 'Sale: %',sale_tup;
      if (not exists (select 1 from sale where sid=sale_tup.sid))
      then
        insert into sale (sid,sdate) values (sale_tup.sid,sale_tup.sdate);
        counter:=counter+1;
      end if;
      exit when counter >= qttup;
   end loop;
end; $$;

create or replace procedure ins_sale_item (qttup int) language plpgsql
as $$
declare
    itBySale int[6]:='{2,4,7,8,9,10}';
    nprod int;
    counter_nprod int := 0;
    sale_item_tup sale_item%rowtype;
    array_prod int[];
    array_sale int[];
    qt_prod int;
    qt_sale int;
    counter int:=0;
begin

    select array_agg(pid) into array_prod from product;
    select count(pid) into qt_prod from product;

    select array_agg(sid) into array_sale from sale;
    select count(sid) into qt_sale from sale;

    nprod := itBySale[(random()*5+1)::int+1];

    loop
        sale_item_tup.sid := array_sale[(random()*(qt_sale-1))::int+1];

            loop
                sale_item_tup.pid := array_prod[(random()*(qt_prod-1))::int+1];
                sale_item_tup.sqty := (random()*1000)::int;
                
                if (not exists (select 1 from sale_item where sid=sale_item_tup.sid and pid=sale_item_tup.pid))
                    then
                    insert into sale_item (sid, pid, sqty) values (sale_item_tup.sid, sale_item_tup.pid, sale_item_tup.sqty);
                    counter_nprod := counter_nprod + 1;
                end if;

                exit when counter_nprod > nprod;
            end loop;

            counter := counter +1;

        exit when counter >= qttup;
    end loop;

end; $$;
```

Procedure call_all:
```sql
create or replace procedure call_all (qtprod int, qtsale int, qtitem int) language plpgsql
as $$
begin
   call ins_product(qtprod);
   call ins_sale(qtsale);
   call ins_sale_item(qtitem);
end; $$;
```

Populando o banco:
```sql
CALL call_all(1000, 500, 1100);
```

#### 10. Criando uma trigger que armazene em uma tabela de auditoria todas as vezes que a quantidade vendida de um produto for alterada (ou uma venda de produto for excluída)
> A tabela de auditoria deverá ter a operação, o valor antigo e novo (se for o caso), data e hora da operação e usuário. Esta tabela não tem PK



#### 11. Criando um índice não único para a data da venda e, neste índice, incluindo o endereço.

#### 12. Para o usuário não dono do BD, dando alguns privilégios: select em product e sale, todos para sale_item.