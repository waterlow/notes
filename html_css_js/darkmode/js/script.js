const btn = document.querySelector('#btn')
btn.addEventListener('click', (event) => {
  document.body.classList.toggle('dark-theme')
  btn.textContent =
    (btn.textContent == 'ダークモードにする') ? 'ライトモードにする' : 'ダークモードにする'
});
