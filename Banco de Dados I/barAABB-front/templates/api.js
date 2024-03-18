
// Função para fazer uma requisição GET
window.getData = async function(url) {
    fetch(url)
      .then(response => response.json())
      .then(data => {
        return data;
      })
      .catch(error => {
        console.error('Erro:', error);
      });
  };
  
  // Função para fazer uma requisição POST
  function postData(url, data) {
    fetch(url, {
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
  
  // Função para fazer uma requisição PUT
  export function putData(url, data) {
    fetch(url, {
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
  
  // Função para fazer uma requisição DELETE
  export function deleteData(url) {
    fetch(url, {
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