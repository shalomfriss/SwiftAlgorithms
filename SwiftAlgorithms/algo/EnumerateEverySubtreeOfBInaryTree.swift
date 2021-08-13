 public class TreeNodex {
     public var val: Int
     public var left: TreeNodex?
     public var right: TreeNodex?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNodex?, _ right: TreeNodex?) {
         self.val = val
         self.left = left
         self.right = right
     }
 }
 
//Find maximal sum of subtree
class EnumerateEverySubtreeOfBinaryTree {
    var maxPath = 0
    func maxPathSum(_ root: TreeNodex?) -> Int {
        if(root == nil) { return 0 }
        maxPath = root!.val
        calcSum(root, maxPath)
        return maxPath
    }
    
    func calcSum(_ node: TreeNodex?, _ sum:Int) {
        if(node == nil) { return }
        
        if(node!.left != nil) {
            let sum1 = sum + node!.left!.val
            maxPath = max(maxPath, sum1)
            calcSum(node!.left, sum1)
        }
        
        if(node!.right != nil) {
            let sum2 = sum + node!.right!.val
            maxPath = max(maxPath, sum2)
            calcSum(node!.right, sum2)
        }
        
        if(node!.left != nil && node!.right != nil) {
            let sum3 = sum + node!.left!.val + node!.right!.val
            maxPath = max(maxPath, sum3)
            calcSum(node!.left, sum3)
            calcSum(node!.right, sum3)
        }
        
        
    }
}
