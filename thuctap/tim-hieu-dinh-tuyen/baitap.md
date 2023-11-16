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


- Bài tập 3: Thực hiện trên switch layer 3 và router
  - Tạo 2 vlan trên switch .cổng f0/1,f0/2 vào vlan 10.Cổng f0/3 ,f0/4 vào vlan 20
  - Cấp dhcp cho 4 máy tính vào 2 vlan gồm network,default gateway(Đặc biệt phải cấu hình)
  - Đặt ip cho cổng f0/5 trên sw và g0/0 trên router
  - Định tuyến RIP 
  - test ping

![Alt](/thuctap/anh/Screenshot_83.png)
- Cấu hình vlan trên sw
```
Switch(config)#interface range fastEthernet 0/1-2
Switch(config-if-range)#switchport mode access
Switch(config-if-range)#switchport access vlan 10
Switch(config-if-range)#exit 
Switch(config)#interface range fastEthernet 0/3-4
Switch(config-if-range)#switchport mode access
Switch(config-if-range)#switchport access vlan 20
Switch(config-if-range)#exit 

```
- Cấp dhcp cho vlan

```
Switch(config)#service dhcp 
Switch(config)#ip dhcp pool vlan10
Switch(dhcp-config)#network 192.168.1.0
Switch(dhcp-config)#default-router 192.168.1.1
exit
Switch(config)#ip dhcp excluded-address 192.168.1.1 // ko cấp ip này//
```

```
Switch(config)#service dhcp 
Switch(config)#ip dhcp pool vlan20
Switch(dhcp-config)#network 192.168.2.0
Switch(dhcp-config)#default-router 192.168.2.1
exit
Switch(config)#ip dhcp excluded-address 192.168.2.1 // ko cấp ip này//
```
- Cấu hình f0/5 SW

```
Switch(config)#interface fastEthernet 0/5
Switch(config-if)#no switchport // Phải tắt thì mới cấu hình ip cho port được//
Switch(config-if)#ip address 192.168.3.1 255.255.255.0
```
- Định tuyến rip trên sw
```
Switch(config)#ip routing // Bật đinh tuyến lên (đây là bước cực quan trọng)//
Switch(config)#router rip
Switch(config-router)#version 2
Switch(config-router)#network 192.168.1.0
Switch(config-router)#network 192.168.2.0
```

- Cấu hình router

```
Router(config)#interface gigabitEthernet 0/0
Router(config-if)#ip address 192.168.3.2 255.255.255.0
no sh
```
- Định tuyến RIP trên router

```
Router(config)#router rip
Router(config-router)#version 2
Router(config-router)#network 192.168.3.0
```
