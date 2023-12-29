const menu = document.querySelector('#menu')
const itemList = [
  { name: 'イチゴ', price: '450', image: 'strawberry.jpg' },
  { name: 'ライム', price: '400', image: 'lime.jpg' },
  { name: 'マンゴー', price: '500', image: 'mango.jpg' },
  { name: 'レモン', price: '400', image: 'lemon.jpg' },
  { name: 'イチジク', price: '500', image: 'fig.jpg' },
  { name: 'リンゴ', price: '400', image: 'apple.jpg' },
]

itemList.forEach(({image, name, price}) => {
  const content = `
    <div>
      <img src="images/${image}" alt="" class="img" />
      <h2 class="sub_title">${name}</h2>
      <p>${price}円</p>
    </div>
  `
  menu.insertAdjacentHTML('beforeend', content)
})
