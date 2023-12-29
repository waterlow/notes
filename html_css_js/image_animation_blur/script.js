document.querySelectorAll('.image_item').forEach((item, i) => {
  item.animate(
    {
      filter: ['blur(20px)', 'blur(0)']
    },
    {
      duration: 600,
      delay: i * 300,
      fill: 'forwards',
    }
  )
})
