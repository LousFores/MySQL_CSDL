create database QuanTriDuAn;
use QuanTriDuAn;
create table PhongBan (
   MaPB varchar(7) primary key,
   TenPB varchar(50)
);
create table NhanVien (
   MaNV varchar(7) primary key,
   TenNV varchar(50),
   NgaySinh datetime,
   SoCMND varchar(9) check (SoCMND regexp '^[0-9]{9}$'),
   GioiTinh ENUM('M', 'F') default 'M',
   DiaChi varchar(100),
   NgayVaoLam datetime,
   MaPB varchar(7),
   foreign key (MaPB) references PhongBan(MaPB) 
);

create table LuongDA (
   MaDA varchar(8),
   MaNV varchar(7),
   NgayNhan datetime,
   SoTien double check (SoTien > 0),
   primary key (MaDA, MaNV),
   foreign key (MaNV) references NhanVien(MaNV)
);

-- Bước 4: Thực hiện truy vấn hiển thị dữ liệu trong các bảng
-- 4.1 Hiển thị thông tin dữ liệu trong Bảng PhongBan
-- 4.2 Hiển thị thông tin dữ liệu trong Bảng NhanVien
-- 4.3 Hiển thị thông tin dữ liệu trong Bảng Luong

-- Bước 5: Thực hiện truy vấn lấy dữ liệu theo yêu cầu
-- 5.1 Hiển thị nhân viên có giới tính Nữ
-- 5.2 Hiển thị tất cả các dự án, mỗi dự án chỉ xuất hiện 1 lần khi hiển thị
-- 5.3 Hiển thị tổng lương của từng nhân viên (Gợi ý: Dùng group by)
-- 5.4 Hiển thị số lượng nhân viên từng phòng
-- 5.5 Tính tổng số lượng các nhân viên trong phòng hành chính
-- 5.6 Hiển thị tống lương của các nhân viên có số CMND tận cùng bằng 9.
-- 5.7 Tìm nhân viên ở phòng Hành chính có giới tính bằng ‘F’ và có mức lương > 1200000.
-- 5.8 Tìm nhân viên có số lương cao nhất
-- 5.9 Liệt kê thông tin chi tiết của nhân viên có tên bắt đầu bằng ký tự ‘N’.
-- 5.10 Xoá dự án có mã dự án là DXD02.

-- Bước 6: Phần mở rộng
-- 6.1 Hiển thị tất cả các nhân viên trên một phòng ban cho trước (VD: ‘Hành chính’).
-- 6.2 Hiển thị mức lương của những nhân viên phòng hành chính.
-- 6.3 Viết một query để hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
-- 6.4 Viết một query hiển thị phòng ban có số lượng nhân viên nhiều nhất.
-- 6.5 Hiển thị tống lương của các nhân viên có số CMND tận cùng bằng 9.
-- 6.6 Tìm nhân viên ở phòng Hành chính có giới tính bằng ‘F’ và có mức lương > 1200000.
-- 6.7 Tìm tổng lương trên từng phòng.
-- 6.8 Liệt kê các dự án có ít nhất 2 người tham gia.
-- 6.9 Hiển thị thông tin chi tiết của nhân viên được nhận tiền dự án trong năm 2003.
-- 6.10 Hiển thị thông tin chi tiết của nhân viên không tham gia bất cứ dự án nào.
-- 6.11 Xoá đi từ bảng LuongDA những nhân viên có mức lương 2000000.
-- 6.12 Cập nhật lại lương cho những người tham gia dự án XDX01 thêm 10% lương cũ.
-- 6.13 Xoá các bản ghi tương ứng từ bảng NhanVien đối với những nhân viên không có mã nhân viên tồn tại trong bảng LuongDA.
-- 6.14 Viết một truy vấn đặt lại ngày vào làm của tất cả các nhân viên thuộc phòng hành chính là ngày 12/02/1999
