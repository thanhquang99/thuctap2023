# Ngày thứ 10 học python
## 1. Vòng lặp trong python
- python cung cấp cho ta 2 loại vòng lặp
  - for: 
  - while
## 2. while
- Nó được sử dụng để thực hiện lặp đi lặp lại một khối câu lệnh cho đến khi một kiện nhất định được thỏa mãn. Khi điều kiện sai,các dòng mã sau sau vòng lặp sẽ được tiếp tục thực hiện.
```
  # syntax
while condition:
    code goes here
```
```
sodem = 0
while sodem < 5:
    print(sodem)
    sodem = sodem + 1
```
## 3. Break and Continue
- Break: Chúng ta sử dụng break khi muốn thoát khỏi hoặc dừng vòng lặp
```
# syntax
while condition:
    code goes here
    if another_condition:
        break
```
```
count = 0
while count < 5:
    print(count)
    count = count + 1
    if count == 3:
        break
```
- Vòng lặp while ở trên chỉ in ra 0, 1, 2 nhưng khi đạt tới 3 thì dừng lại.
## 4. continue
- Với câu lệnh continue, chúng ta có thể bỏ qua lần lặp hiện tại và tiếp tục với lần lặp tiếp theo:
```
  # syntax
while condition:
    code goes here
    if another_condition:
        continue
```
```
count = 0
while count < 5:
    if count == 3:
        count = count + 1
        continue
    print(count)
    count = count + 1
```
- Vòng lặp while ở trên chỉ in 0, 1, 2 và 4 (bỏ qua 3).
## 5. Vòng lặp for
- Được sử dụng để tạo ra vòng lặp, tương đương với các ngôn ngữ lập trình khác, nhưng có một số khác biệt về cú pháp. Vòng lặp được sử dụng để lặp lại một chuỗi(đó có thể là một list, tuple, dirtionary, set, string)
- vòng lặp for cho list:
  ```
    num_list = [0, 1, 2, 3, 4, 5]
    for num in num_list: 
        print('Các số là: ',num)
  ```
* Vòng lặp với chuỗi
    ```
    # syntax
    for iterator in string:
        code goes here
    ```
    ```
    word = 'quang'
    for Show in word:
        print(Show)
    ```

    ```
    q
    u
    a
    n
    g
    ```

## 6. Break và coutinue - part 2
- Break : Chúng ta sử dụng break khi muốn dừng vòng lặp trước khi nó hoàn thành
```
# syntax
for iterator in sequence:
    code goes here
    if condition:
        break
```

```
numbers = (0,1,2,3,4,5)
for number in numbers:
    print(number)
    if number == 3:
        break
```
continue: Khi chúng  tôi muốn bỏ qua một số bước trong quá trình lặp lại của vòng lặp
```
  # syntax
for iterator in sequence:
    code goes here
    if condition:
        continue
```

```
numbers = (0,1,2,3,4,5)
for number in numbers:
    print(number)
    if number == 3:
        continue
    print('số tiếp theo:  ', number + 1) if number != 5 else print("Vòng lặp kết thúc") # for short hand conditions need both if and else statements
print('Bên ngoài vòng lặp')
```
```
~/python$ python3 d10.py 
0
số tiếp theo:   1
1
số tiếp theo:   2
2
số tiếp theo:   3
3
4
số tiếp theo:   5
5
Vòng lặp kết thúc
Bên ngoài vòng lặp
```

Trong ví dụ trên, nếu số bằng 3, bước sau điều kiện(nhưng bên trong vòng lặp) sẽ bị bỏ qua và thực hiện vòng lặp continue nếu còn lại bất kỳ lần lặp nào.
## 7. Hàm Range
- Hàm range() được sử dụng để liệt kê các số.
- Cú pháp cơ bản của hàm range() là:
```
range(stop)
range(start, stop)
range(start, stop, step)
```
- Sử dụng range() để tạo một dãy số:
```
# In các số từ 0 đến 4
for i in range(5):
    print(i)
# Output: 0 1 2 3 4
```
- Sử dụng range() với giá trị bắt đầu và kết thúc:
```
# In các số từ 2 đến 6
for i in range(2, 7):
    print(i)
# Output: 2 3 4 5 6
```
- Sử dụng range() với bước nhảy:
```
# In các số từ 1 đến 10 với bước nhảy là 2
for i in range(1, 11, 2):
    print(i)
# Output: 1 3 5 7 9
```

## 8. Vòng lặp lồng nhau
- Chúng ta có thể viết các vòng lặp bên trong một vòng lặp
```
# syntax
for x in y:
    for t in x:
        print(t)
```
- ví dụ:
```
# Dãy số
numbers = [1, 2, 3]

# Dãy chữ cái
letters = ['a', 'b', 'c']

# Vòng lặp for lồng nhau
for num in numbers:
    for char in letters:
        print(num, char)

```
- out put
```
1 a
1 b
1 c
2 a
2 b
2 c
3 a
3 b
3 c
```
## 9. For else
- Nếu chúng ta muốn thực thi một số thông báo khi vòng lặp kết thúc, chúng ta sử dụng else.
```
# In các số chẵn từ 0 đến 9 và kiểm tra xem có số lẻ nào không
for num in range(0, 10, 2):
    print(num)
else:
    print('The loop ended')
```
- out put
```
0
2
4
6
8
The loop ended
```
## 10. Pass
- Trong python khi câu lệnh được yêu cầu(sau dấu chấm phẩy), Nhưng chúng ta không muốn thực thi bất kỳ đoạn mã nào ở đó, chúng ta có thể viết từ pass để tránh qua lỗi. Ngoài ra chúng ta có thể sử dụng nó như một trình dữ chỗ, cho các câu lệnh trong tương lai.
```
for i in range(5):
    if i == 2:
        pass  # Không có hành động nào khi i là 2
    else:
        print(i)
```
```
1
3
4
5
```
