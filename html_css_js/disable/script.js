document.querySelector('#check').addEventListener('change', (event) => {
  document.querySelector('#button').disabled = !event.currentTarget.checked
})
