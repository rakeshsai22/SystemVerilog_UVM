def most_vowel_substring(s: str, k: int) -> str:
    if k <= 0 or k > len(s):
        return "Not found!"
    vowels = set("aeiou")

    # count vowels in first window [0, k)
    count = sum(1 for c in s[:k] if c in vowels)
    max_count = count
    best_start = 0

    # slide window: left index i, right index i+k-1
    for i in range(1, len(s) - k + 1):
        # char leaving: s[i-1], char entering: s[i+k-1]
        if s[i - 1] in vowels:
            count -= 1
        if s[i + k - 1] in vowels:
            count += 1

        # update best (earliest index wins on ties because we only update on strictly greater)
        if count > max_count:
            max_count = count
            best_start = i

    return s[best_start:best_start + k] if max_count > 0 else "Not found!"
