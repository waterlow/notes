(new IntersectionObserver(
  (entry) => {
    entry[0].target.animate(
      {
        opacity: [0, 1],
        translate: ['50px 0', 0],
      },
      600
    )
  })
).observe(document.querySelector('.image'));
