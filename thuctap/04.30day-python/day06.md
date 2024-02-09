# Day 6 học pỵthon
## 1. Tuples là gì
Là một tập hợp các kiểu dữ liệu khác nhau được sắp xếp theo thứ tự và không thể thay đổi. Các bộ giá trị được viết bằng dấu ngoặc tròn,(). Khi Tuple được tạo, ta không thể nào thay đổi các giá trị của nó. Chúng ta không thể sử dụng phương thức add, insert, remove trong một Tuple vì nó không thể sửa đổi. Không giống như List, Tuple có ít phương thức. Các phương pháp liên quan đến bộ giá trị nàoL
* `tuple()`: Để tạo một Tuple trống
* `count()`: Để đếm số lượng của một item được chỉ định trong tuple
* `index()`: Để tìm Item 
    * `Operator`: Để nối 2 hoặc nhiều bộ và tạo ra tuple mới
## 2. ## Tạo một tuple
* Tạo một tuple trống
```
# syntax
empty_tuple = ()
# or using the tuple constructor
empty_tuple = tuple()
```
* Tuple với giá trị ban đầu
```
# syntax
tpl = ('item1', 'item2','item3')
```
## 3. Chiều dài Tuple


```
qua = ('Táo', 'Ổi', 'Xoài', 'Mít')
print(len(qua)) #4

```

## 4. Truy cập các tuple item
```
qua = ('Táo', 'Ổi', 'Xoài', 'Mít')
print(len(qua)) #4
qua1= qua[1] #Ổi
qua2= qua[2] #Xoài
qua1= qua[-4] #Táo
qua2= qua[-2] #Xoài
```