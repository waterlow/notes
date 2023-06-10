const colorChanged = (event) => {
  const color = event.target.value
  document.querySelector('#colorText').textContent =
    color === '#ffffff' ? `カラーコード:${color}(white)` : `カラーコード:${color}`
  document.body.style.backgroundColor = color
}
document.querySelector('#colorPicker')
  .addEventListener('input', colorChanged)
