class HoaQua:
    def __init__(self, ten, so_luong):
        self.ten = ten
        self.so_luong = so_luong
# self sử dụng để tham chiếu đến đối tượng khi khởi tạo
# qua_cam = HoaQua("Cam", 5) thì qua_cam là self
# Khởi tạo danh sách 10 loại hoa quả
danh_sach_qua = [
    HoaQua("Cam", 5),
    HoaQua("Táo", 8),
    HoaQua("Dưa lưới", 3),
    HoaQua("Chuối", 10),
    HoaQua("Dâu", 6),
    HoaQua("Lựu", 2),
    HoaQua("Kiwi", 4),
    HoaQua("Xoài", 7),
    HoaQua("Nho", 9),
    HoaQua("Ổi", 1),
]

def hien_thi_danh_sach():
    print("Danh sách hoa quả:")
    for qua in danh_sach_qua:
        print(f"{qua[0]}: {qua[1]} quả")

def them_qua():
    ten_qua = input("Nhập tên hoa quả mới: ")
    
    so_luong_input = input("Nhập số lượng quả: ")

    if so_luong_input.isdigit(): # isdigit() kiểm tra xem tất có phải số ko
        so_luong = int(so_luong_input)
        if so_luong >= 0:
            danh_sach_qua.append(HoaQua(ten_qua, so_luong))
            print(f"Đã thêm {so_luong} {ten_qua} vào danh sách.")
        else:
            print("Số lượng không hợp lệ. Vui lòng nhập số lượng lớn hơn hoặc bằng 0.")
    else:
        print("Số lượng không hợp lệ. Vui lòng nhập một số nguyên.")

def kiem_tra_qua():
    ten_qua = input("Nhập tên hoa quả cần kiểm tra: ")
    for qua in danh_sach_qua:
        if qua.ten.lower() == ten_qua.lower(): # lower() dùng để chuyển tất cả ký tự thành chữ thường
            print(f"{ten_qua} có trong danh sách.")
            return
    print(f"{ten_qua} không có trong danh sách.")

def doi_ten_qua():
    ten_cu = input("Nhập tên hoa quả cần đổi: ")
    for qua in danh_sach_qua:
        if qua.ten.lower() == ten_cu.lower():
            ten_moi = input("Nhập tên mới: ")
            qua.ten = ten_moi
            print(f"Đã đổi tên {ten_cu} thành {ten_moi}.")
            return
    print(f"{ten_cu} không có trong danh sách.")

def xoa_qua():
    ten_qua = input("Nhập tên hoa quả cần xóa: ")
    for qua in danh_sach_qua:
        if qua.ten.lower() == ten_qua.lower():
            danh_sach_qua.remove(qua)
            print(f"Đã xóa {ten_qua} khỏi danh sách.")
            return
    print(f"{ten_qua} không có trong danh sách.")

while True:
    print("\nChọn chức năng:")
    print("1. Xem danh sách hoa quả")
    print("2. Thêm hoa quả")
    print("3. Kiểm tra hoa quả")
    print("4. Đổi tên hoa quả")
    print("5. Xóa hoa quả")
    print("0. Thoát chương trình")

    lua_chon = input("Nhập lựa chọn: ")
    if lua_chon == "1":
        hien_thi_danh_sach()
    elif lua_chon == "2":
        them_qua()
    elif lua_chon == "3":
        kiem_tra_qua()
    elif lua_chon == "4":
        doi_ten_qua()
    elif lua_chon == "5":
        xoa_qua()
    elif lua_chon == "0":
        print("Thoát chương trình. Tạm biệt!")
        break
    else:
        print("Lựa chọn không hợp lệ. Vui lòng chọn lại.")
