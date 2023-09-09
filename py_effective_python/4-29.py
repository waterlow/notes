stock = {
    'nails': 125,
    'screws': 35,
    'wingnuts': 8,
    'washers': 24,
}

order = ['screws', 'wingnuts', 'clips']

def get_batches(count, size):
  return count // size

result = {}
for name in order:
  count = stock.get(name, 0)
  batches = get_batches(count, 8)
  if batches:
    result[name] = batches

print(result)

{name: batches for name in order
if (batches := get_batches(stock.get(name, 0), 8))}

# エラーになる
# {name: (tenth := count // 10)
#  for name, count in stock.items() if tenth > 0}

# エラーにならない
{name: tenth
for name, count in stock.items() if (tenth := count // 10) > 0}

# ウォルラスを使うと変数名がリークする
half = [(squared := last ** 2)
  for count in stock.values()
  if (last := count // 2) > 10
]
f'{half} {last} {squared}'

[c // 2 for c in stock.values()]
# print(c) リークしない

# ジェネレータ
fount = ((name, batches) for name in order
        if (batches := get_batches(stock.get(name, 0),8)))
next(fount)
next(fount)
