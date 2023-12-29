addEventListener('scroll', () => {
  const pageHeight = document.documentElement.scrollHeight;
  const viewHeight = document.documentElement.clientHeight;

  const percentage = 100 * scrollY / (pageHeight - viewHeight)
  document.querySelector('#bar').style.width = `${percentage}%`
})
