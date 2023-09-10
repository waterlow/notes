def index_words(text):
  result = []
  if text:
    result.append(0)
  for index, letter in enumerate(text):
    if letter == ' ':
      result.append(index + 1)
  return result

address = 'Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal.'
index_words(address)

def index_words_iter(text):
  if text:
    yield 0
  for index, letter in enumerate(text):
    if letter == ' ':
      yield index + 1
it = index_words_iter(address)
list(it)

# ファイルの読み方例
with open('/content/sample_data/README.md', 'r') as f:
  for line in f:
    print(line)

def index_file(handle):
  offset = 0
  for line in handle:
    if line:
      yield offset
    for letter in line:
      offset += 1
      if letter == ' ':
        yield offset

import itertools

with open('/content/sample_data/README.md', 'r') as f:
  it = index_file(f)
  results = itertools.islice(it, 0, 10)
  print(list(results))
