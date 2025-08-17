class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        # m : num of rows
        # n : num of cols
        # matrix : input 2d list
        # if exists :
        #   return true 
        # else : 
        #   return false

        m, n = len(matrix), len(matrix[0])
        l, r = 0, m * n - 1

        while l <= r:
            mid = (l + r) // 2
            row = mid // n
            col = mid % n
            val = matrix[row][col]

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



        