-- Tabela de Intervalos
CREATE TABLE intervalos (
	codintervalo SERIAL NOT NULL,
	horario VARCHAR(100) NOT NULL,
	CONSTRAINT pk_intervalos PRIMARY KEY (codintervalo)
);

-- Tabela de Operadores
CREATE TABLE operadores (
	codop INTEGER NOT NULL,
	nome_op VARCHAR(100) NOT NULL,
	intervalo INTEGER NOT NULL,
	CONSTRAINT pk_operadores PRIMARY KEY (codop)
	CONSTRAINT fk_opintervalos FOREIGN KEY (intervalo) REFERENCES intervalos(codintervalo)
);

-- Tabela de Situação dos Operadores
CREATE TABLE sit_operadores (
	codop INTEGER NOT NULL,
	situacao_op INTEGER NOT NULL,
	CONSTRAINT pk_sit_operadores PRIMARY KEY (codop),
	CONSTRAINT fk_sit_operadores FOREIGN KEY (codop) REFERENCES operadores(codop)
);

-- Tabela de MIPs
CREATE TABLE mips (
	codmip INTEGER NOT NULL,
	nome_mip VARCHAR(100) NOT NULL,
	desc_mip VARCHAR(100) NULL,
	CONSTRAINT pk_mips PRIMARY KEY (codmip)
);

-- Tabela de Situação dos MIPs
CREATE TABLE sit_mips (
	codmip INTEGER NOT NULL,
	situacao_mip INTEGER NOT NULL,
	CONSTRAINT pk_sit_mips PRIMARY KEY (codmip),
	CONSTRAINT fk_sit_mips FOREIGN KEY (codmip) REFERENCES mips(codmip)
);

-- Tabela de Escala/Relacionamento (Ops x Mips)
CREATE TABLE ops_mips (
	codescala SERIAL NOT NULL,
	codmip INTEGER NOT NULL,
	codop INTEGER NOT NULL,
	dia VARCHAR(100) NOT NULL,
	horario INTEGER NOT NULL,
	desc_mipop VARCHAR(100) NULL,
	CONSTRAINT pk_ops_mips PRIMARY KEY (codescala),
	CONSTRAINT fk_ops_mips FOREIGN KEY (codmip) REFERENCES mips(codmip),
	CONSTRAINT fk_mips_ops FOREIGN KEY (codop) REFERENCES operadores(codop),
	CONSTRAINT fk_ops_mips_intervalos FOREIGN KEY (horario) REFERENCES intervalos(codintervalo)
);