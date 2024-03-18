import { getData } from "../generic_resources/api";
import { postData } from "../generic_resources/api";
import { putData } from "../generic_resources/api";
import { deleteData } from "../generic_resources/api";

const URL = 'http://localhost:8090/baraabbAPI/api/v1/cliente';

async function getData() {
  try {
    const data = await getData(URL);
    console.log(data);
  } catch (error) {
    console.error('Erro:', error);
  }
}

