def normalize(numbers):
  total = sum(numbers)
  result = []
  for v in numbers:
    percent = 100 * v / total
    result.append(percent)
  return result

def read_visitors(path):
  with open(path) as f:
    for line in f:
      yield int(line)


it = read_visitors('/content/sample_data/my_numbers.txt')
percentages = normalize(it)
print(percentages)

it = read_visitors('/content/sample_data/my_numbers.txt')
list(it)
list(it)

def normalize2(numbers):
  numbers = list(numbers)
  total = sum(numbers)
  result = []
  for v in numbers:
    percent = 100 * v / total
    result.append(percent)
  return result

it = read_visitors('/content/sample_data/my_numbers.txt')
percentages = normalize2(it)
print(percentages)

def normalize3(get_iter):
  total = sum(get_iter())
  result = []
  for v in get_iter():
    percent = 100 * v / total
    result.append(percent)
  return result

percentages = normalize3(lambda: read_visitors('/content/sample_data/my_numbers.txt'))
print(percentages)

class ReadVisits:
  def __init__(self, data_path):
    self.data_path = data_path

  def __iter__(self):
    with open(self.data_path) as f:
      for line in f:
        yield int(line)

path = '/content/sample_data/my_numbers.txt'
visits = ReadVisits(path)
normalize(visits)

from collections.abc import Iterator

def normalize4(numbers):
  if isinstance(numbers, Iterator):
    raise TypeError('must supply a container')
  total = sum(numbers)
  result = []
  for v in numbers:
    percent = 100 * v / total
    result.append(percent)
  return result

normalize4([15, 35, 80])
normalize4(ReadVisits(path))

# 以下はエラーになる
# normalize4(iter([15, 35, 80]))
