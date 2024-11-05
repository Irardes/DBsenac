git clone https://github.com/Irardes/DBsenac.git
cd DBsenac

mkdir biblioteca-node
cd biblioteca-node
npm init -y

npm install mysql2


const mysql = require('mysql2');
const fs = require('fs');
const path = require('path');

// Criar uma conexão com o banco de dados
const connection = mysql.createConnection({
    host: 'localhost',     // O endereço do seu servidor MySQL
    user: 'seu_usuario',   // Seu usuário do MySQL
    password: 'sua_senha', // Sua senha do MySQL
    database: 'Biblioteca' // O nome do seu banco de dados
});

// Conectar ao banco de dados
connection.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados: ' + err.stack);
        return;
    }
    console.log('Conectado como id ' + connection.threadId);

    // Executar os comandos SQL do arquivo Atividade4.sql
    executeSQLFromFile(path.join(__dirname, 'Atividade4.sql'));
});

// Função para executar os comandos SQL a partir de um arquivo
function executeSQLFromFile(filePath) {
    // Ler o arquivo SQL
    fs.readFile(filePath, 'utf8', (err, sql) => {
        if (err) {
            console.error('Erro ao ler o arquivo SQL: ' + err);
            return;
        }

        // Dividir as instruções SQL em um array
        const sqlCommands = sql.split(';').map(command => command.trim()).filter(command => command);

        // Executar cada comando SQL
        sqlCommands.forEach(command => {
            connection.query(command, (err, results) => {
                if (err) {
                    console.error('Erro ao executar o comando SQL: ' + err);
                    return;
                }
                console.log('Comando executado com sucesso: ' + command);
            });
        });

        // Encerrar a conexão após a execução de todos os comandos
        connection.end();
    });
}
