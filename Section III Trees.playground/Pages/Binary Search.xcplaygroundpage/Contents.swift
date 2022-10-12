import Foundation

// 1
public extension RandomAccessCollection where Element: Comparable {
    // 2
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        //  2.1
        let range = range ?? startIndex..<endIndex
        // 2.2
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        // 2.3
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        // 2.4
        if self[middle] == value {
            return middle
        // 2.5
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}
/**
 1. 由于二分查找仅适用于符合 RandomAccessCollection 的类型，因此您将该方法添加到 RandomAccessCollection 的扩展中。 此扩展受到限制，因为您需要能够比较元素。
 2. 二分查找是递归的，所以需要传入一个范围来查找。参数范围是可选的，因此您可以在不指定范围的情况下开始搜索。在这种情况下，如果 range 为 nil，则将搜索整个集合。
 以下是步骤：
 a. 首先，检查范围是否为零。 如果是这样，您将创建一个涵盖整个集合的范围。
 b. 然后，检查范围是否包含至少一个元素。 如果没有，则搜索失败，您返回 nil。
 c. 现在您确定范围内有元素，您可以在范围内找到中间索引。
 d. 然后将此索引处的值与您正在搜索的值进行比较。 如果值匹配，则返回中间索引。
 e. 如果没有，则递归搜索集合的左半部分或右半部分。
 */

let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31)
print("firstIndex(of:): \(String(describing: search31))")
print("binarySearch(for:): \(String(describing: binarySearch31))")
/**
 firstIndex(of:): Optional(7)
 binarySearch(for:): Optional(7)
 */
