CREATE TABLE modalidade (
    id INT NOT NULL PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT uk_id UNIQUE (id)
)  ENGINE=INNODB;

/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber quais serão as modalidades
*/
insert into modalidade values (1,'futebol'),
(2,'handebol'), (3,'Vôlei'), (4,'basquete');
select * from modalidade;

CREATE TABLE naipe (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT uk_id UNIQUE (id)
)  ENGINE=INNODB;

insert into naipe values (1,'Masculino'), (2,'Feminino'),(3,'Misto');
/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber quais serão os naipes
*/

CREATE TABLE competicao (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    modalidade INT NOT NULL,
    naipe INT NOT NULL,
    inicio DATETIME,
    fim DATETIME,
    CONSTRAINT uk_id UNIQUE (id),
    CONSTRAINT fk_modalidade FOREIGN KEY (modalidade)
        REFERENCES modalidade (id),
    CONSTRAINT fk_naipe FOREIGN KEY (naipe)
        REFERENCES naipe (id)
)  ENGINE=INNODB;

/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber quais serão as competições
*/

CREATE TABLE relac_atleta (
    competicao INT NOT NULL PRIMARY KEY,
    atleta INT NOT NULL,
    CONSTRAINT uk_competicao UNIQUE (competicao),
    CONSTRAINT uk_atleta UNIQUE (atleta),
    CONSTRAINT fk_competicao FOREIGN KEY (competicao)
        REFERENCES competicao (id),
	constraint fk_atleta foreign key (atleta)
		references atleta (id)
)  ENGINE=INNODB;

/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber a relação de atletas 
*/


CREATE TABLE orgao_exp (
    id INT NOT NULL PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    sigla VARCHAR(15),
    CONSTRAINT _uk_id UNIQUE (id)
)  ENGINE=INNODB;

insert into orgao_exp values (1,'Secretaria de Segurança Pública','SSP');
insert into orgao_exp values (2,'Departamento de Trânsito','Detran');
insert into orgao_exp values(3,'Ministério do Trabalho e Emprego','MTE');
insert into orgao_exp values (4,'Cartório Civil','CV');
insert into orgao_exp values(5,'Departamento de Polícia Federal ','DPF');
insert into orgao_exp values(6,'Academia Brasileira de Neurocirurgia','ABNC');
insert into orgao_exp values(7,'Coordenação Geral de Polícia de Imigração da Polícia Federal','DUREX');
insert into orgao_exp values(8,'Cordenação Geral de Privilégios e Imunidades','CGPI');
insert into orgao_exp values(9,'Cordenadoria Geral de Polícia Marítima, Aeronáutica e de Fronteiras','CGPMAF');
insert into orgao_exp values(10,'Conselho Nacional de Imigração','CNIG');
insert into orgao_exp values(11,'Conselho Regional de Enfermagem','COREN');
insert into orgao_exp values(12,'Conselho Regional de Administração','CRA');
insert into orgao_exp values(13,'Centro de Referência de Assistência Social','CRAS');
insert into orgao_exp values(14,'Conselho Regional de Biblioteconomia','CRB');
insert into orgao_exp values(15,'Conselho Regional de Contabilidade','CRC');
insert into orgao_exp values(16,'Fundo de Garantia do Tempo de Serviço','FGTS');
insert into orgao_exp values(17,'Secretária de Polícia Técnico-Ciêntifica','SPTC');
insert into orgao_exp values(18,'Ordem dos Advogados do Brasil','OAB');
insert into orgao_exp values(19,'Instituto Geral de Perícias','IGP');
insert into orgao_exp values(20,'Secretária de Estado da Casa Civíl','SECC');
insert into orgao_exp values(21,'Polícia Militar','PM');
insert into orgao_exp values(22,'Instituto Médico Legal','IML');

/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber quais serão os orgãos expedidores
*/

CREATE TABLE atleta (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    orgao INT NOT NULL,
    uf_rg CHAR(2) NOT NULL,
    nascimento DATE NOT NULL,
     CONSTRAINT uk_ufRg UNIQUE (uf_rg),
    CONSTRAINT fk_orgao FOREIGN KEY (orgao)
        REFERENCES orgao_exp (id)	
)  ENGINE=INNODB;

/*
@autor: Rogério André Queke Jnior
@data de Criação: 02/03/2020
@Data da Última atualização: 03/03/2020
* Criação da tabela marca, para saber quais serão os atletas
*/
