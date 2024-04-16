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

#### 3. Cria SCHEMA 

```sql
CREATE SCHEMA desenv;
```

```sql
GRANT USAGE ON SCHEMA desenv TO clara1;
```

#### 4. Apontando o esquema como padrão para um usuário

```sql
ALTER USER clara1 SET search_path TO desenv;
```

#### 5. Criando um banco de dados utilizando uma das tablespaces criadas como default, no esquema criado

```sql
CREATE DATABASE mydb TABLESPACE tbs01;
```

#### 6. Alterando o dono do BD para um dos usuários criados

```sql
ALTER DATABASE mydb OWNER TO clara1;
```

#### 7. Acessando o BD

```sql
\c mydb
```

#### 8. Criando o script do banco de dados utilizado em aulas anteriores (produto x venda)

#### 9. Populando e o BD com os scripts implementados em sala de aula (1000 produtos, 500 cupons e +1000 produtos vendidos)

#### 10. Criando uma trigger que armazene em uma tabela de auditoria todas as vezes que a quantidade vendida de um produto for alterada
> A tabela de auditoria deverá ter a operação, o valor antigo e novo (se for o caso), data e hora da operação e usuário. Esta tabela não tem PK

#### 11. Criando um índice não único para a data da venda e, neste índice, incluindo o endereço.

#### 12. Para o usuário não dono do BD, dando alguns privilégios: select em product e sale, todos para sale_item.