matrix = [[1,2,3], [4,5,6], [7,8,9]]
flat = [x for row in matrix for x in row]
print(flat)

# 以下と同じ
a = []
for row in matrix:
  for x in row:
    a.append(x)
print(a)

# 2重ループなんだと捉えると多少わかりやすいかも
multi_loop = [x for x in [1, 2] for y in ['a', 'b', 'c']]
print(multi_loop)

squared = [[x**2 for x in row] for row in matrix]
print(squared)

my_lists = [
    [[1,2,3], [4,5,6]],
    [[11,12,13], [14,15,16]]
]
flat = [k for list_i in my_lists
        for list_j in list_i
        for k in list_j]
print(flat)

f2 = []
for list_i in my_lists:
  for list_j in list_i:
    f2.extend(list_j)
print(f2)

a = [1,2,3,4,5,6,7,8,9,10]
b = [x for x in a if x > 4 if x % 2 == 0]
c = [x for x in a if x > 4 and x % 2 == 0]
print(b)
print(c)

matrix = [[1,2,3], [4,5,6]]
filtered = [[x for x in list_a if x % 3 == 0] for list_a in matrix if sum(list_a) >= 10]
print(filtered)
