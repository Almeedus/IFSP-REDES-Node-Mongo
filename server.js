const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const app = express();
const port = 3000;

// Configuração do body-parser para lidar com dados do formulário
app.use(bodyParser.urlencoded({ extended: true }));

// Conectando ao MongoDB
mongoose.connect('mongodb://localhost:27017/emailsDB', { useNewUrlParser: true, useUnifiedTopology: true });

// Criando o schema e o modelo
const emailSchema = new mongoose.Schema({
  email: String
});

const Email = mongoose.model('Email', emailSchema);

// Servindo o formulário HTML
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

// Lidando com o envio do formulário
app.post('/submit', (req, res) => {
  const newEmail = new Email({
    email: req.body.email
  });

  newEmail.save((err) => {
    if (!err) {
      res.send('Email salvo com sucesso!');
    } else {
      res.send('Erro ao salvar o email.');
    }
  });
});

// Iniciando o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
