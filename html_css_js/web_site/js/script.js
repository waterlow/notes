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

const menu = document.querySelector('#menu-panel')
const menuItems = document.querySelectorAll('#menu-panel li')
const option = {
  duration: 1400,
  easing: 'ease',
  fill: 'forwards',
}
document.querySelector('#menu-open').addEventListener('click', () => {
  menu.animate({ translate: ['100vw', 0]}, option)

  menuItems.forEach((element, i) => {
    element.animate(
      { opacity: [0, 1], translate: ['2rem', 0] },
      {
        duration: 2400,
        delay: 300 * i,
        easing: 'ease',
        fill: 'forwards'
      }
    )
  })
})

document.querySelector('#menu-close').addEventListener('click', () => {
  menu.animate({ translate: [0, '100vw']}, option)
  menuItems.forEach((element) => {
    element.animate({ opacity: [1, 0] }, option)
  })
})
