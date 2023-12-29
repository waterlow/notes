document.querySelectorAll('.image_item').forEach((item, i) => {
  item.animate(
    {
      opacity: [0, 1],
      translate: ['0 50px', 0]
    },
    {
      duration: 600,
      delay: i * 300,
      fill: 'forwards',
    }
  )
})
