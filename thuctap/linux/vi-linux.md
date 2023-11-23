- [Hướng dẫn sử dụng trình soạn thảo `vi` trong linux](#hướng-dẫn-sử-dụng-trình-soạn-thảo-vi-trong-linux)
  - [Các lệnh trong vi](#các-lệnh-trong-vi)
  - [Chỉnh sửa trong vi](#chỉnh-sửa-trong-vi)
- [tài liệu tham khảo](#tài-liệu-tham-khảo)

# Hướng dẫn sử dụng trình soạn thảo `vi` trong linux
- Linux là tập hợp hệ thống các file được triển khai dưới dạng sơ dồ cây nên khi ta muốn sửa đổi hay cấu hình gì đó trong linux thì việc chúng ta cần làm là sửa đổi file theo mục đích sử dụng của chúng ta
- để sử dụng vi thì ta thực hiện lệnh sau:

```
vi [đường dẫn của file]
```
- ví dụ : `vi /etc/ssh/sshd_config`
- Nó sẽ đưa ta vào file và có giao diện như thế này:

![Alt](/thuctap/anh/Screenshot_186.png)

- Ở trong vi có 2 chế độ là `chỉnh sửa` hoặc `lệnh`. Khi bạn vưa vừa mới vào Vi thì bạn đang ở chế độ lệnh bạn có thể thực hiện rất nhiều lệnh ở chế độ này. khi bạn nhấn `i` thì bạn đã vào chế độ chèn (insert) và để chuyển về chế độ lệnh bạn hãy gõ phím `esc`
## Các lệnh trong vi
- `:w` lưu và tiếp tục chỉnh sửa
- `:q!` thoát mà không lưu
- `:wq` hoặc `:x` thoát và lưu
- `yy` sao chép dòng mà con trỏ đang đứng
- `p` dán dòng đã sao chép ở trên vào vị trí con trỏ
- `o` Mỏ 1 dòng mới dưới dòng hiện tại
- `0` Mở 1 dòng mới trên dòng hiện tại
- `a` Chỉnh sửa văn bản mà bắt đầu sau vị trí con trỏ
- `dd` xóa dòng ở vị trí con trỏ hiện tại
- `:set nu` đánh dấu tất cả các dòng
- `Xdd` xóa dòng thứ X
- `Yyy` sao chép dòng thứ Y
- `:x` trỏ đến dòng thứ x
- `h` di chuyển sang trái 1 kí tự
- `l` di chuyển sang phải 1 ký tự
- `j` di chuyển xuống dòng dưới
- `k` di chuyển lên dòng trên

## Chỉnh sửa trong vi
- Ta chỉnh sưa trong vi như chỉnh sửa trong word thông thường (xóa thì là backspace, xuống dòng là enter)

# tài liệu tham khảo

https://www.redhat.com/sysadmin/introduction-vi-editor