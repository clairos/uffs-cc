const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.shadowMap.enabled = true;
document.body.appendChild(renderer.domElement);

const geometry = new THREE.BoxGeometry();
const material = new THREE.MeshStandardMaterial({ color: 0x00ff00 });
const cube = new THREE.Mesh(geometry, material);
cube.castShadow = true;
scene.add(cube);

const planeGeometry = new THREE.PlaneGeometry(500, 500);
const planeMaterial = new THREE.ShadowMaterial({ opacity: 0.5 });
const plane = new THREE.Mesh(planeGeometry, planeMaterial);
plane.rotation.x = - Math.PI / 2;
plane.position.y = -2;
plane.receiveShadow = true;
scene.add(plane);

const light = new THREE.DirectionalLight(0xffffff, 1);
light.position.set(5, 5, 5);
light.castShadow = true;
scene.add(light);

const ambientLight = new THREE.AmbientLight(0x404040);
scene.add(ambientLight);

camera.position.z = 5;

function animate() {
    requestAnimationFrame(animate);
    renderer.render(scene, camera);
}
animate();

// utiliza as teclas de seta para mover o cubo na tela
window.addEventListener('keydown', (event) => {
    if (event.key === 'ArrowUp') {
        cube.position.y += 0.1;
    } else if (event.key === 'ArrowDown') {
        cube.position.y -= 0.1;
    } else if (event.key === 'ArrowLeft') {
        cube.position.x -= 0.1;
    } else if (event.key === 'ArrowRight') {
        cube.position.x += 0.1;
    }
});

// rotaciona o cubo ao clicar na tecla 'r'
window.addEventListener('keydown', (event) => {
    if (event.key === 'r') {
        cube.rotation.x += 0.1;
        cube.rotation.y += 0.1;
    }
});

// muda a cor do cubo ao clicar na tecla 'c'
window.addEventListener('keydown', (event) => {
    if (event.key === 'c') {
        cube.material.color.set(Math.random() * 0xffffff);
    }
});
