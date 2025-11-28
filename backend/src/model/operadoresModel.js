import db from '../config/database.js';

// Função para inserir um novo operador no banco de dados
const insertOperador = async (operador) => {
  try {
    const {codop, nome_op, intervalo} = operador;
    const result = await db.query(
      'INSERT INTO operadores (codop, nome_op, intervalo) VALUES ($1, $2, $3) RETURNING *',
      [codop, nome_op, intervalo]
    );
    return result[0];
  } catch (error) {
    console.error('Erro ao inserir operador:', error.message);
    throw error;
  }
};

const updateOperador = async (codop, updates) => {
  const fields = Object.keys(updates);
  const values = Object.values(updates);

  if (fields.length === 0) {
    throw new Error('Nenhum campo para atualizar.');
  }

  const setString = fields.map((field, idx) => `${field} = $${idx + 1}`).join(', ');
  const query = `UPDATE operadores SET ${setString} WHERE codop = $${fields.length + 1} RETURNING *`;

  try {
    const result = await db.query(query, [...values, codop]);
    return result[0];
  } catch (error) {
    console.error('Erro ao atualizar operador:', error.message);
    throw error;
  }
};

const deleteOperador = async (codop) => {
  try {
    const result = await db.query('DELETE FROM operadores WHERE codop = $1 RETURNING *', [codop]);
    return result[0];
  } catch (error) {
    console.error('Erro ao deletar operador:', error.message);
    throw error;
  }
};  

const operadoresAll = async () => {
  try {
    console.log('Iniciando consulta ao banco...');
    const rows = await db.query('SELECT * FROM operadores ORDER BY codusuario ASC');
    console.log('Consulta finalizada:', rows);
    if (!rows) {
      return { error: 'Nenhum resultado encontrado.' };
    }
    return rows;
  } catch (error) {
    console.error('Erro ao buscar operadores:', error.message);
    return { error: 'Erro ao buscar operadores.' };
  }
};


const getOperadorById = async (codop) => {
  try {
    const result = await db.query('SELECT * FROM operadores WHERE codop = $1', [codop]);
    if (result.length === 0) {
      return { error: 'Operador não encontrado.' };
    }
    return result[0];
  } catch (error) {
    console.error('Erro ao buscar operador:', error.message);
    throw error;
  }
};

export default {
    deleteOperador,
    insertOperador,
    updateOperador,
    getOperadorById,
    operadoresAll
};