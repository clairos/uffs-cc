const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
scene.add(ambientLight);

const directionalLight = new THREE.DirectionalLight(0xffffff, 0.8);
directionalLight.position.set(5, 10, 7).normalize();
scene.add(directionalLight);

const textureLoader = new THREE.TextureLoader();

const cubeTexture = textureLoader.load('https://threejs.org/examples/textures/brick_diffuse.jpg');
const cubeGeometry = new THREE.BoxGeometry();
const cubeMaterial = new THREE.MeshBasicMaterial({ map: cubeTexture });
const cube = new THREE.Mesh(cubeGeometry, cubeMaterial);
cube.position.x = -4;
scene.add(cube);

const sphereTexture = textureLoader.load('https://threejs.org/examples/textures/uv_grid_opengl.jpg');
const sphereGeometry = new THREE.SphereGeometry(1, 32, 32);
const sphereMaterial = new THREE.MeshPhongMaterial({ map: sphereTexture });
const sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
sphere.position.x = 0;
scene.add(sphere);

const coneGeometry = new THREE.ConeGeometry(1, 2, 32);
const coneMaterial = new THREE.MeshBasicMaterial({ wireframe: true });
const cone = new THREE.Mesh(coneGeometry, coneMaterial);
cone.position.x = 4;
scene.add(cone);

camera.position.z = 10;

function animate() {
    requestAnimationFrame(animate);
    cube.rotation.x += 0.01;
    cube.rotation.y += 0.01;
    sphere.rotation.y += 0.01;
    cone.rotation.x += 0.01;
    renderer.render(scene, camera);
}
animate();
