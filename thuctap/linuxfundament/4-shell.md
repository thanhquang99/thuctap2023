# Phần mở rộng của shell
- Nói một cách đơn giản, shell là một chương trình nhận lệnh từ bàn phím và đưa chúng cho hệ điều hành thực hiện

## 1) Khoảng trắng trong shell
- Mặc định nhiều khoảng trắng liên tiếp sẽ được loại bỏ trong shell
- Để hiển thị nhiều khoảng trắng thì ta phải đưa nó vào trong dấu `""`
- Ví dụ 

```
echo "xin chao     bạn"
```

## 2) alias (bí danh)
- Đây là câu lệnh đặt bí danh cho cho các lệnh, thay vì gõ lệnh ra thì ta chỉ việc gọi bí danh thì sẽ tiện hơn
- Cấu trúc lệnh

```
alias [bí danh]=[tên lệnh]
```
- Ví dụ : ta muốn clear nhanh màn hình chỉ bằng việc gõ chứ c

```
alias c=clear
```
- Một vài công dụng khác của lệnh alias
  - 