use db_lion_school;

show tables;

create table tbl_aluno (
	id int UNSIGNED not null auto_increment primary key, 
    nome varchar(80) not null,
    foto varchar(100) not null,
    sexo varchar(1),
    rg varchar(15) not null,
    cpf varchar(18) not null,
    email varchar(256) not null,
    telefone varchar(18),
    celular varchar(18),
    data_nascimento date not null,
    unique index(id)
    
);


create table tbl_curso(
	id int UNSIGNED not null auto_increment primary key,
    nome varchar(50) not null,
    carga_horaria int not null,
    icone varchar(100) not null,
    sigla varchar(6) not null,
    unique index(id)
);


create table tbl_aluno_curso (
	id int unsigned not null auto_increment primary key,
    id_aluno int unsigned not null,
    id_curso int unsigned not null,
    matricula varchar(15),
    status_aluno varchar(10) not null,
    
    # Programacao para definir uma chave estrangeira
    foreign key (id_aluno) #define qual o atributo sera uma FK (foreign key)
		references tbl_aluno (id), #define de onde vira a PK (primary key)
	foreign key (id_curso) #define qual o atributo sera uma FK (foreign key)
		references tbl_curso (id), #define de onde vira a PK (primary key)
	unique index (id)
);

drop table tbl_usuario;

insert into tbl_aluno (nome, 
						foto, 
                        sexo, 
                        rg,
                        cpf,
                        email,
                        telefone,
                        celular,
                        data_nascimento)
	values 				('Jose da Silva',
						'https://pt.vecteezy.com/arte-vetorial/567902-icone-de-pessoa',
                        'M',
						'34.456.666-1',
                        '300.576.456-23',
                        'jose@gmail.com',
                        '011 4556-7777',
                        '011 9 9765-6660',
                        '2000-04-10'
                        ); 
                        
              
              insert into tbl_aluno (nome, 
						foto, 
                        sexo, 
                        rg,
                        cpf,
                        email,
                        telefone,
                        celular,
                        data_nascimento)
	values 				('Maria da Silva',
						'https://www.flaticon.com/br/icone-gratis/mulher_180675',
                        'F',
						'31.456.98-1',
                        '760.576.456-09',
                        'maria@gmail.com',
                        '011 4226-7777',
                        '011 9 9345-6660',
                        '1990-07-19'
                        ); 

select cast(id as float) as id, nome, foto, sexo, rg, cpf, email, telefone, celular, data_nascimento  from tbl_aluno;

select id from tbl_aluno order by id desc limit 1;

select * from tbl_aluno_curso;

use db_lion_school;

select tbl_curso.id as id_curso, tbl_curso.nome as nome_curso, tbl_curso.sigla as sigla_curso, tbl_curso.carga_horaria,
	tbl_aluno_curso.matricula, tbl_aluno_curso.status_aluno
	from tbl_aluno
			inner join tbl_aluno_curso
				on tbl_aluno.id = tbl_aluno_curso.id_aluno
			inner join tbl_curso
				on tbl_curso.id = tbl_aluno_curso.id_curso
		where tbl_aluno.id = 17;