window.addEventListener('load', () => {
  document.querySelector('#loading').animate(
    { opacity: [1, 0], visibility: 'hidden' },
    {
      duration: 2000,
      delay: 1200,
      fill: 'forwards',
      easing: 'ease',
    }
  )
  document.querySelector('#loading-screen').animate(
    { translate: ['0 100vh', '0 0', '0 -100vh'] },
    {
      duration: 2000,
      delay: 800,
      fill: 'forwards',
      easing: 'ease',
    }
  )
  document.querySelector('#loading-text').animate(
    [
      { opacity: 1, offset: .8 },
      { opacity: 0, offset: 1 },
    ],
    {
      duration: 1200,
      fill: 'forwards',
      easing: 'ease',
    }
  )
})

document.querySelectorAll('.gallery-thumbnail-image').forEach((element) => {
  element.addEventListener('mouseover', (event) => {
    const largeImage = document.querySelector('.gallery-image-image')
    largeImage.src = event.target.src
    largeImage.animate({ opacity: [0, 1]}, 500)
  })
})
