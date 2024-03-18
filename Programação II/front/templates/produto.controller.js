/**************************
 **VARIAVEIS OBRIGATORIAS**
 * @model
 * @caminhoApi
 **************************/

const caminhoApi = 'http://localhost:8090/baraabbAPI/api/v1/produto';
var model = {};

var urlCategoria = 'http://localhost:8090/baraabbAPI/api/v1/categoriaproduto';
var urlUsuario = 'http://localhost:8090/baraabbAPI/api/v1/usuario';



// FUNCAO QUE PREENCHE LISTAGEM
function popularTabelaProdutos() {
  const tableProdutos = document.getElementById('table_produtos');

  getAllData()
    .then(data => {
      data.forEach(produto => {
        const row = tableProdutos.insertRow();

        const idCell = row.insertCell();
        idCell.textContent = produto.idProduto;

        const descricaoCell = row.insertCell();
        descricaoCell.textContent = produto.descricao;

        const precoCompraCell = row.insertCell();
        precoCompraCell.textContent = 'R$ ' + produto.precoCompra;

        const precoVendaCell = row.insertCell();
        precoVendaCell.textContent = 'R$ ' + produto.precoVenda;

        const qtdEstoqueCell = row.insertCell();
        qtdEstoqueCell.textContent = produto.quantidadeEstoque;

        const usuarioCadastroCell = row.insertCell();
        usuarioCadastroCell.textContent = produto.usuarioCadastro.login;

        const idCategoriaCell = row.insertCell();
        idCategoriaCell.textContent = produto.categoriaProduto.descricao;

        const dataCadastroCell = row.insertCell();
        dataCadastroCell.textContent = new Date(produto.dataCadastro).toLocaleString();

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
          iniciarEdicao(produto.idProduto);
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

          var newUrl = caminhoApi + '/' + produto.idProduto;
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
  const input_descricao = document.getElementById('inputNomeProduto').value;
  const preco_compra = document.getElementById('inputValCompra').value;
  const preco_venda = document.getElementById('inputValVenda').value;
  const quantidade_estoque = document.getElementById('inputQtd').value;

  //preenchendo model
  model.descricao = input_descricao;
  model.precoCompra = preco_compra;
  model.precoVenda = preco_venda
  model.quantidadeEstoque = quantidade_estoque


  if (id.length !== 0) {
    model.idProduto = id,
    update(model);
  } else {
    model.datacadastro = new Date();
    salvarNovo(model);
  }
}

async function iniciarEdicao(ID) {
  // Redirecionar para o formulário de cadastro_produto
  window.location.href = `cadastro_produto.html?idProduto=${ID}`;
}

//PREENCHER FORMULARIO COM DADOS PARA EDITAR
async function popularFormularioParaEditar(ID) {
  try {
    model = await getById(caminhoApi, ID);

    document.getElementById('inputCodigo').value = model.idProduto
    document.getElementById('inputNomeProduto').value = model.descricao;
    document.getElementById('categoriaproduto').value = model.categoriaProduto.id;
    document.getElementById('inputValCompra').value = model.precoCompra;
    document.getElementById('inputValVenda').value = model.precoVenda;
    document.getElementById('inputQtd').value = model.quantidadeEstoque;
    document.getElementById('usuario').value = model.usuarioCadastro.id;
  } catch (error) {
    console.error('Erro:', error);
  }
}

function setUpDados() {
  popularSeletor(urlCategoria, 'categoriaproduto', 'default');
  popularSeletor(urlUsuario, 'usuario', 'usuario');
}

async function setarCategoria(idSeletor) {

  var seletor = document.getElementById(idSeletor);
  var idCategoria = seletor.value;
  model.categoriaProduto = await getById(urlCategoria, idCategoria)
  
}

async function setarUsuario(idSeletor) {
  var seletor = document.getElementById(idSeletor);
  var idUsuario = seletor.value;

  model.usuarioCadastro = await getById(urlUsuario, idUsuario)

  console.log(model);
}

/*********************
 **METODOS GENERICOS**
 *********************/

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

function findApiData(path) {
  return fetch(path)
    .then(response => response.json())
    .then(data => {
      return data;
    })
    .catch(error => {
      console.error('Ocorreu um erro:', error);
    });
}

async function getById(urlApi,ID) {
  const newUrl = `${urlApi}/${ID}`;
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

function popularSeletor(urlApi, idSeletor, type) {

  var seletor = document.getElementById(idSeletor);

  findApiData(urlApi).then(data => {
    data.forEach(function (object) {

      var option = document.createElement('option');
      option.textContent = getObjectType(object, type);;
      option.value = object.id;
  
      seletor.appendChild(option);
    });
  })
  .catch(error => {
    console.error('Ocorreu um erro:', error);
  });
}

function getObjectType(object, type) {
  switch (type) {
    case 'cliente':
      return object.nome;     
    
      case 'usuario':
      return object.login; 
    
    default:
      return object.descricao
  }
}