const caminhoApi = 'http://localhost:8090/baraabbAPI/api/v1/categoriaproduto';

// FUNCAO QUE PREENCHE LISTAGEM
function popularTabelaCategorias() {
  const tableCategorias = document.getElementById('table_categorias');

  getAllData()
    .then(data => {
      data.forEach(categoria => {
        const row = tableCategorias.insertRow();

        const idCell = row.insertCell();
        idCell.textContent = categoria.idCategoriaProduto;

        const descricaoCell = row.insertCell();
        descricaoCell.textContent = categoria.descricao;

        const margemCell = row.insertCell();
        margemCell.textContent = categoria.percentualMargem;

        const dataCadastroCell = row.insertCell();
        dataCadastroCell.textContent = new Date(categoria.dataCadastro).toLocaleString();

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
            iniciarEdicao(categoria.idCategoriaProduto);
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

          var newUrl = caminhoApi + '/' + categoria.idCategoriaProduto;
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

function getCategorias() {
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

function cadastrar() {
  console.log('CADASTRANDO');
  const id = document.getElementById('inputCodigo').value;
  const descricao = document.getElementById('inputNome').value;
  const margem = document.getElementById('inputMargem').value;

  const data = {
    descricao: descricao,
    percentualMargem: margem
  };

  if (id.length !== 0) {
    data.idCategoriaProduto = id,
    update(data);  
  } else{
    data.datacadastro = new Date();
    salvarNovo(data);
  }
  window.location.href = `consulta_categoria.html`;
}

async function iniciarEdicao(ID) {
  // Redirecionar para o formulário de cadastro_categoria
  window.location.href = `cadastro_categoria.html?idCategoria=${ID}`;
}

//PREENCHER FORMULARIO COM DADOS PARA EDITAR
async function popularFormularioParaEditar(ID){
  try {
    const categoria = await getById(ID);
    // Preencher o formulário com os dados do categoria para edição

    document.getElementById('inputCodigo').value = categoria.idCategoriaProduto;
    document.getElementById('inputNome').value = categoria.descricao;
    document.getElementById('inputMargem').value = categoria.percentualMargem;
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


