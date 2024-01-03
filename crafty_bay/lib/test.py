class Solution(object):
    def findMatrix(self, nums):
        freq = [0] * (len(nums) + 1)
        print(f'here is the freq = {freq}')
        ans = []
        i = 1
        for c in nums:
            print(f'i = {i} ^^^  now c = {c}')
            if freq[c] >= len(ans):
                ans.append([])
                print(f'inside ans =  {ans} and freq[c] = {freq[c]} ')
            
            ans[freq[c]].append(c)
            print(f'outside ans =  {ans} and freq[c] = {freq[c]} ')
            freq[c] += 1
            i+=1

        return ans

# Test cases
solution = Solution()
nums2 = [1,  2, 3, 4,5,2,1,  2, 3, 4,5]
result2 = solution.findMatrix(nums2)
print("Result for nums2:", result2)
print("sort for nums2:", result)
