const text = document.querySelector('#colorText')
document.querySelector('#colorPicker').addEventListener('input', (event) => {
  const color = event.target.value
  document.body.style.backgroundColor = color
  if (color === '#ffffff') {
    text.textContent = `カラーコード:${color}（white）`
  } else if (color === '#000000') {
    text.textContent = `カラーコード:${color}（black）`
  } else {
    text.textContent = `カラーコード：${color}`
  }
})
