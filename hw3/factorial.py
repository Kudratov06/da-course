n, m = map(int, input().split())
a = [*map(int, input().split())]
b = [*map(int, input().split())]
ans = 10 ** 18
res = 0
for i in range(n - 1, -1, -1):
    if i < m:
        ans = min(ans, res + a[i])
    res += min(a[i], b[i])
print(ans)