a = [1,2,3,4,5,6,7,8,9,10]
squares = []
for x in a:
    squares.append(x**2)
print(squares)

s2 = [x**2 for x in a]
print(s2)

s3 = list(map(lambda x: x ** 2, a))
print(s3)

even_squares = [x**2 for x in a if x % 2 == 0]
print(even_squares)

alt = list(map(lambda x: x**2, filter(lambda x: x % 2 == 0, a)))
print(alt)

even_squares_dict = {x: x**2 for x in a if x % 2 == 0}
print(even_squares_dict)
threes_cubed_set = {x**3 for x in a if x % 3 == 0}
print(threes_cubed_set)

alt_dict = dict(map(lambda x: (x, x**2), filter(lambda x: x % 2 == 0, a)))
print(alt_dict)
alt_set = set(map(lambda x: x **3, filter(lambda x: x % 3 == 0, a)))
print(alt_set)
