package xx
import std.io.*
import std.collection.*

main() {
    // 读取输入字符串
    let s = readln()
    
    // 特殊情况处理：空字符串
    if (s.size == 0) {
        println("0")
        return
    }
    
    // 滑动窗口算法
    var max_len: Int64 = 0          // 记录最长无重复子串的长度
    var left: Int64 = 0             // 滑动窗口的左边界
    var char_map = HashMap<Rune, Int64>()  // 哈希表：字符 -> 该字符最近出现的位置索引
    
    // 遍历字符串，右边界right不断向右移动
    for (right in 0..(s.size - 1)) {
        // 当前字符（单字符字符串），将字节转换为 Rune
        let current_char = Rune(s[right])
        
        // 如果当前字符已经在窗口中出现过
        let maybe_last_pos = char_map.get(current_char)
        if(let Some(lastpos) <- maybe_last_pos) {
            // 上次出现位置
            if (let Some(pos) <- char_map.get(current_char)) {
                if (pos + 1 > left) {
                    left = pos + 1
                }
            }
        }else{
            println("pass_error")
        }
        
        let (x,y) = (1,2)
        
        
        // 更新当前字符的最新位置
        char_map.add(current_char, right)
        
        // 计算当前窗口的长度
        let current_len = right - left + 1
        
        // 更新最大长度
        max_len = max(max_len, current_len)
    }
    
    // 输出结果
    println("${max_len}")
}