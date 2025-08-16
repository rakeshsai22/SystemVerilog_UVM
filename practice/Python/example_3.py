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

        mid = int(len(nums)/2)
        if(target > mid):
            



