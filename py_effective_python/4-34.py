import math

def wave(amplitude, steps):
  step_size = 2 * math.pi / steps
  for step in range(steps):
    radians = step * step_size
    fraction = math.sin(radians)
    output = amplitude * fraction
    yield output

def transmit(output):
  if output is None:
    print(f'Output is None')
  else:
    print(f'Output: {output:>5.1f}')

def run(it):
  for output in it:
    transmit(output)

# run(wave(1.0, 100))

def my_generator():
  received = yield 1
  print(f'received = {received}')

# it = iter(my_generator())
# output = next(it)
# print(f'output = {output}')

# try:
#   next(it)
# except StopIteration:
#   pass
# else:
#     assert False

it = iter(my_generator())
output = it.send(None)
print(f'output = {output}')

try:
  it.send('hello!')
except StopIteration:
  pass
else:
    assert False

def wave_modulating(steps):
  step_size = 2 * math.pi / steps
  amplitude = yield
  for step in range(steps):
    radians = step * step_size
    fraction = math.sin(radians)
    output = amplitude * fraction
    amplitude = yield output

def rum_modulating(it):
  amplitudes =  [
      None, 7,7,7,2,2,2,2,10,10,10,10,10
  ]
  for amplitude in amplitudes:
    output = it.send(amplitude)
    transmit(output)

# rum_modulating(wave_modulating(12))

def complex_wave():
  yield from wave(7.0, 3)
  yield from wave(2.0, 4)
  yield from wave(10.0, 5)

# run(complex_wave())

def complex_wave_modulatiog():
  yield from wave_modulating(3)
  yield from wave_modulating(4)
  yield from wave_modulating(5)

# rum_modulating(complex_wave_modulatiog())

def wave_cascading(amplitude_it, steps):
  step_size = 2 * math.pi / steps
  for step in range(steps):
    radians = step * step_size
    fraction = math.sin(radians)
    amplitude = next(amplitude_it)
    output = amplitude * fraction
    yield output

def complex_wave_cascading(amplitude_it):
  yield from wave_cascading(amplitude_it, 3)
  yield from wave_cascading(amplitude_it, 4)
  yield from wave_cascading(amplitude_it, 5)

def run_cascading():
  amplitudes = [7, 7, 7, 2, 2, 2, 2, 10, 10, 10, 10, 10]
  it = complex_wave_cascading(iter(amplitudes))
  for amplitude in amplitudes:
    output = next(it)
    transmit(output)

run_cascading()
