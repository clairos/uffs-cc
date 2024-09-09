const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.shadowMap.enabled = true;
document.body.appendChild(renderer.domElement);

const light = new THREE.DirectionalLight(0xffffff, 1);
light.position.set(5, 5, 5);
light.castShadow = true;
scene.add(light);

light.shadow.mapSize.width = 1024;
light.shadow.mapSize.height = 1024;

const planeGeometry = new THREE.PlaneGeometry(10, 10);
const planeMaterial = new THREE.MeshStandardMaterial({ color: 0x808080 });
const plane = new THREE.Mesh(planeGeometry, planeMaterial);
plane.rotation.x = -Math.PI / 2;
plane.position.y = -1;
plane.receiveShadow = true;
scene.add(plane);

const geometry1 = new THREE.BoxGeometry();
const material1 = new THREE.MeshStandardMaterial({ color: 0x32CD32 }); // Verde mais claro
const cube1 = new THREE.Mesh(geometry1, material1);
cube1.position.x = -2.5;
cube1.castShadow = true;
scene.add(cube1);

const geometry2 = new THREE.BoxGeometry();
const material2 = new THREE.MeshStandardMaterial({ color: new THREE.Color(1, 0.41, 0.71) });
const cube2 = new THREE.Mesh(geometry2, material2);
cube2.position.x = 2.5;
cube2.castShadow = true;
scene.add(cube2);

const geometry3 = new THREE.BoxGeometry(0.5, 0.5, 0.5);
const material3 = new THREE.MeshStandardMaterial({ color: 0x8A2BE2 });
const cube3 = new THREE.Mesh(geometry3, material3);
cube3.position.x = 0;
cube3.castShadow = true;
scene.add(cube3);

camera.position.z = 5;

function animate() {
    requestAnimationFrame(animate);

    cube1.rotation.x += 0.01;
    cube1.rotation.y += 0.01;

    cube2.rotation.x += 0.01;
    cube2.rotation.y += 0.01;

    cube3.rotation.x += 0.01;
    cube3.rotation.y += 0.01;

    renderer.render(scene, camera);
}

animate();

window.addEventListener('resize', () => {
    renderer.setSize(window.innerWidth, window.innerHeight);
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
});
