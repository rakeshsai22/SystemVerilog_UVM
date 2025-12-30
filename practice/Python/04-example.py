class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        # m : num of rows
        # n : num of cols
        # matrix : input 2d list
        # if exists :
        #   return true 
        # else : 
        #   return false

        m = len(matrix)
        n = len(matrix[0])
        # l, r = 0, m * n - 1

        # while l <= r:
        #     mid = (l + r) // 2
        #     i = mid // n
        #     j = mid % n
        #     val = matrix[i][j]

        #     if val == target:
        #         return True
        #     elif val < target:
        #         l = mid + 1
        #     else:
        #         r = mid - 1

        # return False

        # binary search to find the only possible row
        top, bot = 0, m - 1
        row = -1
        while top <= bot:
            mid = (top + bot) // 2
            if matrix[mid][0] <= target <= matrix[mid][n - 1]:
                row = mid
                break
            elif target < matrix[mid][0]:
                bot = mid - 1
            else:  # target > matrix[mid][n - 1]
                top = mid + 1

        if row == -1:
            return False  # no row can contain target

        # binary search within that row
        l, r = 0, n - 1
        while l <= r:
            mid = (l + r) // 2
            val = matrix[row][mid]
            if val == target:
                return True
            elif val < target:
                l = mid + 1
            else:
                r = mid - 1

        return False
    # check the target if its less than or greater than the first element
    # and proceed to the row which matches. and check if the last element 
    # is lesser than the target so we need not check the entire row.

    # we can take up the l and r similar to the last and use it here for
    # each row start and end and iterate them over all the rows, and add
    # check like if the target is in between the l and r of that row nad 
    # then go for the mid and check for the target



        