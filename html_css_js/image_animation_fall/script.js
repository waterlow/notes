document.querySelectorAll('.image_item').forEach((item, i) => {
  item.animate(
    {
      opacity: [0, 1],
      rotate: ['5deg', 0],
      scale: [1.1, 1]
    },
    {
      duration: 600,
      delay: i * 300,
      fill: 'forwards',
    }
  )
})
