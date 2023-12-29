document.querySelector('#heading').animate(
  {
    opacity: [0, 1],
    translate: ['0 50px', '0']
  },
  {
    duration: 2000,
    easing: 'ease'
  },
)

document.querySelector('#heading2').animate(
  {
    rotate: ['x 360deg', '0']
  },
  1000
)

document.querySelector('#heading3').animate(
  {
    color: ['#f66', '#fc2', '#0c6', '#0bd']
  },
  {
    duration: 8000,
    direction: 'alternate',
    iterations: Infinity,
  }
)

document.querySelector('#heading4').animate(
  {
    color: ['transparent', '#fff'],
    backgroundPosition: ['100% 0', '0 0']
  },
  {
    duration: 2000,
    easing: 'ease'
  }
)

document.querySelector('#heading5').animate(
  {
    borderRadius: [
      '20% 50% 50% 70%/50% 50% 70% 50%',
      '50% 20% 50% 50%/40% 40% 60% 60%',
      '50% 40% 20% 40%/40% 50% 50% 80%',
      '50% 50% 50% 20%/40% 40% 60% 60%',
    ]
  },
  {
    duration: 8000,
    direction: 'alternate',
    iterations: Infinity,
  }
)
