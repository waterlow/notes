[...Array(100)].forEach((_, i) => {
  const j = i + 1
  let s = `${j % 3 === 0 ? 'Fizz' : ''}${j % 5 === 0 ? 'Buzz' : ''}`
  console.log(s || j)
})
