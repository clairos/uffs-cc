const cena = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderizador = new THREE.WebGLRenderer();
renderizador.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderizador.domElement);

const geometry = new THREE.BoxGeometry(1, 1, 1);
const material1 = new THREE.MeshBasicMaterial({ color: 0xff0000 });
const material2 = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const material3 = new THREE.MeshBasicMaterial({ color: 0x0000ff });
const material4 = new THREE.MeshBasicMaterial({ color: 0xffff00 });

const cubo1 = new THREE.Mesh(geometry, material1);
cubo1.position.set(0, 0, 0);
cena.add(cubo1);

const cubo2 = new THREE.Mesh(geometry, material2);
cubo2.position.set(-3, 0, 0);
cena.add(cubo2);

const cubo3 = new THREE.Mesh(geometry, material3);
cubo3.position.set(3, 0, 0);
cena.add(cubo3);

const cubo4 = new THREE.Mesh(geometry, material4);
cubo4.position.set(0, -3, 0);
cena.add(cubo4);

camera.position.z = 10;

function animacao() {
    requestAnimationFrame(animacao);

    cubo1.position.x += 0.01;
    cubo1.position.y += 0.01;
    cubo1.position.z += 0.01;

    cubo2.scale.x = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;
    cubo2.scale.y = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;
    cubo2.scale.z = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;

    cubo3.rotation.x += 0.01;
    cubo3.rotation.y += 0.01;
    cubo3.rotation.z += 0.01;

    cubo4.position.x += 0.01;
    cubo4.position.y += 0.01;
    cubo4.position.z += 0.01;
    cubo4.scale.x = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;
    cubo4.scale.y = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;
    cubo4.scale.z = Math.abs(Math.sin(Date.now() * 0.001)) + 0.5;
    cubo4.rotation.x += 0.01;
    cubo4.rotation.y += 0.01;
    cubo4.rotation.z += 0.01;

    renderizador.render(cena, camera);
}
animacao();
