## Bài tập 1
- Có 2 switch và trên mỗi switch tạo ra 3 vlan lần lượt là 10,20,30
- Tiến hành cấu hinh vlan và trunk vlan để các vlan trên 2 switch liên lạc với nhau
- Tiến hành tạo Vlan 40 ,ở switch 2 tạo native vlan và xem quá trình

![Alt](/thuctap/anh/Screenshot_65.png)

- Ta tiến hành vào mode config và cấu hình ở switch 1 như sau:

```
int f0/1
switchport mode access
switchport access vlan 10
exit
int f0/2
switchport mode access
switchport access vlan 10
exit
int f0/3
switchport mode access
switchport access vlan 20
exit
int f0/4
switchport mode access
switchport access vlan 30
exit

int f0/5
switchport mode trunk
exit
```
- ta tiến hành cấu hình ở switch 2 tương tự

```
int f0/1
switchport mode access
switchport access vlan 10
exit
int f0/2
switchport mode access
switchport access vlan 10
exit
int f0/3
switchport mode access
switchport access vlan 20
exit
int f0/4
switchport mode access
switchport access vlan 30
exit

int f0/5
switchport mode trunk
exit
```
- Để cấu hình Vlan native thì thực hiện tạo vlan 40 ở switch 1 và cấu hình native ở swich 2, ở đây tôi chỉ cấu hình native ở switch 2 còn việc làm ở switch 1 thì ta làm tương tự như bước trên

```
int f0/6
switchport mode trunk
switchport trunk native vlan 40
```

- Bài tập 2

![Alt](/thuctap/anh/Screenshot_69.png)

![Alt](/thuctap/anh/Screenshot_70.png)


- 