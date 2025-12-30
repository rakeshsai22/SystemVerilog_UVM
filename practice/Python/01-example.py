def longestSubarray(arr):
    counts = {}
    l = 0
    max_len = 0

    for r, x in enumerate(arr):
        counts[x] = counts.get(x, 0) + 1

        # shrink while >2 distinct or (2 distinct but diff > 1)
        while True:
            if len(counts) <= 2:
                if len(counts) < 2:
                    ok = True
                else:
                    kmin = min(counts)
                    kmax = max(counts)
                    ok = (kmax - kmin) <= 1
            else:
                ok = False

            if ok:
                break

            left_val = arr[l]
            counts[left_val] -= 1
            if counts[left_val] == 0:
                del counts[left_val]
            l += 1

        max_len = max(max_len, r - l + 1)

    return max_len


if __name__ == "__main__":
    import sys
    data = list(map(int, sys.stdin.read().strip().split()))
    if not data:
        print(0)
    else:
        n = data[0]
        arr = data[1:1+n]
        print(longestSubarray(arr))
