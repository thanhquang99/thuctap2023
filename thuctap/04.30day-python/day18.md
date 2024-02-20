# Ngầy 18 học python
## 1. Biểu thức chính quy
- Biểu thức chính quy hay RegEx là một chuỗi văn bản đặc biệt giúp tìm các mẫu trong dữ liệu
-  RegEx có thể được sử dụng để kiểm tra xem một số mẫu có tồn tại trong một loại dữ liệu khác hay không.
-  Để sử dụng RegEx ta cần input module re
    ```
    import re
    ```
- Các phương thức trong module re
  - re.match() :  chỉ tìm kiếm ở đầu dòng đầu tiên của chuỗi và trả về các đối tượng phù hợp nếu tìm thấy, nếu không thì trả về Không
  - re.search : Trả về một đối tượng khớp nếu có một đối tượng ở bất kỳ đâu trong chuỗi, bao gồm cả chuỗi nhiều dòng
  - re.findall : Trả về danh sách chứa tất cả kết quả phù hợp
  - re.split : Lấy một chuỗi, tách nó tại các điểm khớp, trả về một danh sách
  - re.sub : Thay thế một hoặc nhiều kết quả khớp trong một chuỗi
- Bạn có thể tham khảo ví dụ sau để dễ hiểu
```
import re

# Ví dụ về chuỗi đầu vào
text = "Python is a powerful programming language. Python is also easy to learn."

# re.match() - Kiểm tra xem chuỗi có bắt đầu bằng "Python" hay không
match_result = re.match("Python", text)
if match_result:
    print("Chuỗi bắt đầu bằng 'Python'.")
else:
    print("Chuỗi không bắt đầu bằng 'Python'.")

# re.search() - Tìm từ "powerful" trong chuỗi
search_result = re.search("powerful", text)
if search_result:
    print("Tìm thấy từ 'powerful' trong chuỗi.")
else:
    print("Không tìm thấy từ 'powerful' trong chuỗi.")

# re.findall() - Liệt kê tất cả các từ "Python" trong chuỗi
findall_result = re.findall("Python", text)
print(f"Tất cả các từ 'Python' trong chuỗi: {findall_result}")

# re.split() - Tách chuỗi thành danh sách các từ
split_result = re.split("\s", text)
print(f"Danh sách các từ sau khi tách: {split_result}")

# re.sub() - Thay thế "Python" bằng "Java"
sub_result = re.sub("Python", "Java", text)
print(f"Chuỗi sau khi thay thế: {sub_result}")
```
- Kết quả
```
Chuỗi bắt đầu bằng 'Python'.
Tìm thấy từ 'powerful' trong chuỗi.
Tất cả các từ 'Python' trong chuỗi: ['Python', 'Python']
Danh sách các từ sau khi tách: ['Python', 'is', 'a', 'powerful', 'programming', 'language.', 'Python', 'is', 'also', 'easy', 'to', 'learn.']
Chuỗi sau khi thay thế: Java is a powerful programming language. Java is also easy to learn.
```
## 2. Các ký tự đặc biệt được sử dụng
- []: Tập hợp các ký tự
  - [az] có nghĩa là bất kỳ chữ cái nào từ a đến z
  - [0-9] có nghĩa là bất kỳ số nào từ 0 đến 9
- \: Ta có thể dùng để in ra các ký tự đặc biệt (lúc này hệ thống sẽ không tính toán ký tự đó)
  - \d có nghĩa là: khớp với chuỗi chứa các chữ số (số từ 0-9)
  - \D có nghĩa là: khớp trong chuỗi không chứa chữ số
- `.` : bất kỳ ký tự nào ngoại trừ ký tự dòng mới(\n)
- `^`: bắt đầu bằng
  - Ta có thể thêm `r` vào để ám chỉ đó là kí tự raw(kí tự thô)
  - `r'^substring'` ví dụ r'^love', một câu bắt đầu bằng từ love
  - `r'[^abc]` các string không có kí tự a hoặc b hoặc c
- $: kết thúc bằng
  - `r'substring$'` ví dụ r'love$', câu kết thúc bằng từ love
- `*` :Biểu thức a* tìm ra các kí tự xuất hiên a không hoặc nhiều lần, có thể hiểu là ghép các chữ a đứng liền vào 1 string và các kí tự không có a thay bằng rỗng
- `+` tường tự với `*` thì nó sẽ là 1 hoặc nhiều lần. Nó sẽ chỉ lấy các kí tự a đứng liền nhau chứ không lấy các kí tự khác
- {3}: Chính xác là 3 ký tự
- {3,}: Ít nhất 3 ký tự
- {3,8}: 3 đến 8 ký tự
- |: Hoặc hoặc
- r'apple|banana' có nghĩa là quả táo hoặc quả chuối
- (): Chụp và nhóm
## 3. Bài tập
1. Từ thường gặp nhất trong đoạn văn sau là gì?
    ```
    paragraph = 'I love teaching. If you do not love teaching what else can you love. I love Python if you do not love something which can give you all the capabilities to develop an application what else can you love.
    ```