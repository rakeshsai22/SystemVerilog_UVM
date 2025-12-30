class Solution:
    def search(self, nums: List[int], target: int) -> int:
        # nums    : [ a sorted (asc) array of unique integers]
        # target  : int to find 
        # return  : true if exists
        #         : -1 if not
        # runtime : O(logn)
        # space   : O(1)
        # n       : size of input array
        # l       : left end of the segement 
        # r       : right end of the segement

        l = 0
        r = len(nums) -1

        while l <= r:
            mid = (l+r)//2

            if nums[mid]==target:
                return mid
            elif nums[mid]>target:n
                r = mid - 1
            else:
                l = mid+1
            
        return -1



