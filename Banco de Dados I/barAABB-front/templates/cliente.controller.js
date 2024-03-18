const caminhoApi = 'http://localhost:8090/baraabbAPI/api/v1/cliente';

// FUNCAO QUE PREENCHE LISTAGEM
function popularTabelaClientes() {
  const tableClientes = document.getElementById('table_clientes');
  getAllData().then(data => {
      data.forEach(cliente => {
        const row = tableClientes.insertRow();

        const idCell = row.insertCell();
        idCell.textContent = cliente.idCliente;

        const nomeCell = row.insertCell();
        nomeCell.textContent = cliente.nome;

        const telefoneCell = row.insertCell();
        telefoneCell.textContent = cliente.telefone;

        const emailCell = row.insertCell();
        emailCell.textContent = cliente.email;

        const observacoesCell = row.insertCell();
        observacoesCell.textContent = cliente.observacoes;

        const dataCadastroCell = row.insertCell();
        dataCadastroCell.textContent = new Date(cliente.datacadastro).toLocaleString();

        const actionCell = row.insertCell();
        const editDeleteContainer = document.createElement('div');
        editDeleteContainer.classList.add('container', 'edit-delete-container');

        const btnGroup = document.createElement('div');
        btnGroup.classList.add('btn-group');

        //CRIANDO BOTAO EDITAR
        const editButton = document.createElement('button');
        editButton.type = 'submit';
        editButton.classList.add('btn', 'btn-info', 'btn-sm', 'text-white');
        editButton.addEventListener('click', () => {
          iniciarEdicao(cliente.idCliente);
        })

        const editIcon = document.createElement('span');
        editIcon.classList.add('material-symbols-outlined');
        editIcon.textContent = 'edit';
        editButton.appendChild(editIcon);
        btnGroup.appendChild(editButton);

        //CRIANDO BOTAO DELETAR
        const deleteButton = document.createElement('button');
        deleteButton.type = 'submit';
        deleteButton.classList.add('btn', 'btn-danger', 'btn-sm', 'text-white');
        deleteButton.addEventListener('click', () => {

          var newUrl = caminhoApi + '/' + cliente.idCliente;
          deletar(newUrl);
          location.reload();
        
        });

        const deleteIcon = document.createElement('span');
        deleteIcon.classList.add('material-symbols-outlined');
        deleteIcon.textContent = 'delete';
        deleteButton.appendChild(deleteIcon);
        btnGroup.appendChild(deleteButton);

        editDeleteContainer.appendChild(btnGroup);
        actionCell.appendChild(editDeleteContainer);
      });
    })
    .catch(error => {
      console.error('Erro:', error);
    });
}

function cadastrar() {
  const id = document.getElementById('inputCodigo').value;
  const nome = document.getElementById('inputNome').value;
  const email = document.getElementById('inputEmail').value;
  const telefone = document.getElementById('inputTel').value;
  const observacoes = document.getElementById('inputObs').value;

  const data = {
    nome: nome,
    email: email,
    telefone: telefone,
    observacoes: observacoes
  };

  if (id.length !== 0) {
    data.idCliente = id,
    update(data);  
  } else{
    data.datacadastro = new Date();
    salvarNovo(data);
  }
}

async function iniciarEdicao(ID) {
  // Redirecionar para o formulário de cadastro_cliente
  window.location.href = `cadastro_cliente.html?idCliente=${ID}`;
}

//PREENCHER FORMULARIO COM DADOS PARA EDITAR
async function popularFormularioParaEditar(ID) {
  try {
    const cliente = await getById(ID);
    document.getElementById('inputCodigo').value = cliente.idCliente
    document.getElementById('inputNome').value = cliente.nome;
    document.getElementById('inputEmail').value = cliente.email;
    document.getElementById('inputTel').value = cliente.telefone;
    document.getElementById('inputObs').value = cliente.observacoes;
  } catch (error) {
    console.error('Erro:', error);
  }
}

/**
 * METODOS GENERICOS
 */

function getAllData() {
  return fetch(caminhoApi)
    .then(response => {
      if (!response.ok) {
        throw new Error('Erro na solicitação da API.');
      }
      return response.json();
    })
    .then(data => {
      return data;
    })
    .catch(error => {
      console.error('Erro:', error);
    });
}

async function getById(ID) {
  const newUrl = `${caminhoApi}/${ID}`;
  try {
    const response = await fetch(newUrl);
    if (!response.ok) {
      throw new Error('Erro na solicitação da API.');
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Erro:', error);
    throw error;
  }
}

function salvarNovo(data) {
  fetch(caminhoApi, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
    .then(response => response.json())
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.error('Erro:', error);
    });
}

function deletar(newUrl) {
  fetch(newUrl, {
    method: 'DELETE'
  })
    .then(response => response.json())
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.error('Erro:', error);
    });
}

function update(data) {
  fetch(caminhoApi, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
    .then(response => response.json())
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.error('Erro:', error);
    });
}

