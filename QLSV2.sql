CREATE DATABASE QLSV2
use QLSV2
drop database QLSV2

CREATE TABLE Khoa
(ma VARCHAR(10) NOT NULL,
tenKhoa NVARCHAR(100) NOT NULL,
namthanhlap int,
PRIMARY KEY(ma))

CREATE TABLE KhoaHoc
(ma varchar(10) NOT NULL,
namBATDAU int,
namKETTHUC int,
PRIMARY KEY(Ma))

CREATE TABLE SinhVien
(Ma VARCHAR(10) NOT NULL,
hoTen nvarchar(100) NOT NULL,
namSinh int,
dantoc nVARCHAR(20) NOT NULL,
maLop varchar(10) NOT NULL,
PRIMARY KEY(Ma))

CREATE TABLE ChuongTrinh
(Ma varchar(10) NOT NULL,
tenChuongTrinh nvarchar(100) NOT NULL,
PRIMARY KEY(Ma))

CREATE TABLE MonHoc
(Ma varchar(10) NOT NULL,
tenMonHoc nvarchar(100) NOT NULL,
maKhoa varchar(10) NOT NULL,
PRIMARY KEY(Ma))

CREATE TABLE KetQua
(maSINHVIEN varchar(10) NOT NULL,
maMonHoc varchar(10) NOT NULL,
lanthi INT,
diem float,
PRIMARY KEY(maSinhVien,maMonHoc,lanthi))

CREATE TABLE GiangKhoa
(maChuongTrinh varchar(10) NOT NULL,
maKhoa varchar(10) NOT NULL,
maMonHoc varchar(10) NOT NULL,
namHoc int,
hocKy int,
soTietLyThuyet int,
soTietThucHanh int,
soTinChi int,
PRIMARY KEY(maChuongTrinh,maKhoa,maMonHoc))

CREATE TABLE Lop
(Ma varchar(10) NOT NULL, 
maKhoaHoc varchar(10) NOT NULL, 
maKhoa varchar(10) NOT null,
maChuongTrinh varchar(10),
soThuTu int,
PRIMARY KEY(Ma))
-------------------tạo khóa ngoại----------
alter table Lop
ADD CONSTRAINT FK_LOP_KHOA FOREIGN KEY(maKhoa)
REFERENCES KHOA(ma)

alter table Lop
ADD CONSTRAINT FK_LOP_KHOAHOC FOREIGN KEY(maKhoaHoc)
REFERENCES KhoaHoc(Ma)

alter table Lop
ADD CONSTRAINT FK_LOP_CHUONGTRINH FOREIGN KEY(maChuongTrinh)
REFERENCES ChuongTrinh(Ma)

alter table GiangKhoa
ADD CONSTRAINT FK_GIANGKHOA_CHUONGTRINH FOREIGN KEY(maChuongTrinh)
REFERENCES ChuongTrinh(Ma)

ALTER TABLE GiangKhoa
ADD CONSTRAINT Fk_GIANGKHOA_KHOA FOREIGN KEY(maKhoa)
REFERENCES Khoa(ma)

ALTER TABLE GiangKhoa
ADD CONSTRAINT FK_GIANGKHOA_MONHOC FOREIGN KEY(maMonHoc)
REFERENCES MonHoc(Ma)

ALTER TABLE KetQua
ADD CONSTRAINT Fk_KETQUA_SINHVIEN foreign key(maSinhVien)
REFERENCES SinhVien(Ma)

ALTER TABLE KetQua
ADD CONSTRAINT FK_KETQUA_MONHOC FOREIGN KEY(maMonHoc)
REFERENCES MonHoc(Ma)

ALTER TABLE MonHoc
ADD CONSTRAINT FK_MONHOC_KHOA FOREIGN KEY(maKhoa)
REFERENCES Khoa(ma)

ALTER TABLE SinhVien
ADD CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY(maLop)
REFERENCES Lop(Ma)
---------------------cập nhật dữ liệu-------------
insert into Khoa values('CNTT',N'Công nghệ thông tin',1995)
insert into Khoa values('VL',N'Vật lý',1970)
select *
from Khoa

INSERT INTO KhoaHoc values('K2002',2002,2006)
insert into KhoaHoc values('k2003', 2003,2007)
insert into KhoaHoc values('k2004', 2004,2008) 
select *
from KhoaHoc

insert into SinhVien values(0212001,N'Nguyễn Vĩnh An',1984,'Kinh','TH2002/01')
insert into SinhVien values(0212002,N'Nguyên Thanh Bình',1985,'kinh','TH2002/01')
insert into SinhVien values(0212003,N'Nguyễn Thanh Cường',1984,'kinh', 'TH2002/02')
insert into SinhVien values(0212004,N'Nguyễn Quốc Duy',1983,'kinh','TH2002/02')
insert into SinhVien values(0311001,N'Phan Tuấn Anh',1985,'kinh','VL2003/01')
insert into SinhVien values(0311002,N'Huỳnh Thanh Sang',1984,'KINH','VL2003/01')
select *
from SinhVien

insert into ChuongTrinh values('CQ',N'chính qui')
select *
from ChuongTrinh

insert into MonHoc values('THT01',N'toán cao cấp A1', 'CNTT')
insert into MonHoc values('VLT01', N'vật lý cao cấp A1', 'VL')
insert into MonHoc values('THT02', N'toán rời rạc','CNTT')
insert into MonHoc values('THCS01', N'CẤU TRÚC DỮ LIỆU 1','CNTT')
insert into MonHoc values('THCS02',N'hệ điều hành','CNTT')
select *
from MonHoc

insert into KetQua values(0212001,'THT01',1,4)
insert into KetQua values(0212001,'THT01',2,7)
insert into KetQua values(0212002,'THT01',1,8)
insert into KetQua values(0212003,'THT01',1,6)
insert into KetQua values(0212004,'THT01',1,9)
insert into KetQua values(0212001, 'THT02',1,8)
insert into KetQua values(0212002,'THT02',1,5.5)
insert into KetQua values(0212003,'THT02',1,4)
insert into KetQua values(0212003,'THT02',2,6)
insert into KetQua values(0212001,'THCS01',1,6.5)
insert into KetQua values(0212002,'THCS01',1,4)
insert into KetQua values(0212003,'THCS01',1,7)
select *
from KetQua

insert into GiangKhoa values('CQ','CNTT','THT01',2003,1,60,0,5)
insert into GiangKhoa values('CQ','CNTT','THT02',2003,2,45,0,4)
insert into GiangKhoa values('CQ','CNTT','THCS01',2004,1,45,30,4)
select *
from GiangKhoa

insert into Lop values('TH2002/01','K2002','CNTT','CQ',1)
insert into Lop values('TH2002/02','K2002','CNTT','CQ',2)
insert into lop values('VL2003/01','K2003','VL','CQ',1)
select *
from Lop
----------bài tập thực hành tuần 2---------------------
--1.danh sách các sinh viên khoa 'công nghệ thông tin'-------------

select *
 from SinhVien,Lop,Khoa
 where SinhVien.maLop=lop.Ma and Lop.maKhoa=Khoa.ma and tenKhoa=N'công nghệ thông tin' 

 --2.danh sách sinh viên khóa 2002-2006
 select *
 from SinhVien,Lop,KhoaHoc
 where SinhVien.maLop=Lop.Ma and Lop.maKhoaHoc=KhoaHoc.ma and namBATDAU=2002 and namKETTHUC=2006
 --3.danh sách sinh viên thi đậu (điểm thi >=5) môn toán cao cấp A1
 select *
 from SinhVien,MonHoc,KetQua
 where sinhvien.Ma=KetQua.maSINHVIEN and MonHoc.ma=KetQua.maMonHoc and tenMonHoc=N'Toán cao cấp A1' and diem>=5
 --4.liệt kê những sinh viên có họ là 'Nguyễn' và đã học môn toán rời rạc
 select *
 from SinhVien,MonHoc,KetQua
 where SinhVien.ma=KetQua.maSINHVIEN and KetQua.maMonHoc=MonHoc.Ma and tenMonHoc=N'toán rời rạc' and SinhVien.hoTen like N'Nguyễn %' and KetQua.lanthi=1
 --5.liệt kê tên các khoa đã thành lập hơn 15 năm 
 select tenKhoa
 from Khoa
 where year(getdate())-namthanhlap>15
 --6.cho biết các sinh viên(MSSV,ho&ten,năm sinh) học sớm hơn tuổi quy định (theo tuổi quy định thì sinh viên đủ 18 khi bắt đầu khóa học)
 select SV.Ma,SV.hoTen,SV.namSinh
 from SinhVien SV,KhoaHoc KH,Lop L
 where SV.maLop=L.Ma and L.maKhoaHoc=KH.ma and KH.namBATDAU-SV.namSinh<18
 --7.cho biết hai sinh viên có điểm thi toán cao cấp A1 cao nhất
 select top(2) SV.hoten,KQ.diem
 from SinhVien SV ,KetQua KQ,MonHoc MH
 where MH.Ma=KQ.maMonHoc and KQ.maSINHVIEN=SV.Ma and MH.tenMonHoc =N'toán cao cấp A1'
 order by KQ.diem DESC

 -------------bài tập thực hành tuần 3----------------------------
 --1.cho biết điểm trung bình của sinh viên Nguyên Thanh Bình( điểm trung bình của các môn thi, lần thi)
 select hoTen, AVG(diem) as diemtb
 from SinhVien SV,KetQua KQ
 where SV.Ma=KQ.maSinhVien and SV.hoTen = N'Nguyên Thanh Bình'
 group by hoTen

 --2.Tìm môn mà chưa sinh viên nào theo học 
 select tenMonHoc
 from MonHoc MH
 where MH.Ma not in (select maMonHoc 
                     from KetQua)
--3.Tìm tất cả các môn học mà sinh viên chương trình chính quy, khoa công nghệ thông tin phải theo học
select tenMonHoc
from MonHoc MH,GiangKhoa GK,ChuongTrinh CT,Khoa K
where MH.Ma = GK.maMonHoc and GK.maChuongTrinh = CT.Ma and MH.maKhoa = K.Ma and CT.tenChuongTrinh =N'Chính qui'
and K.tenKhoa =N'Công nghệ thông tin'

--4. Với mỗi lớp thuộc khoa công nghệ thông tin, cho biết  mã lớp, mã khóa học, và số sinh viên thuộc lớp đó 
select maLop,maKhoaHoc,count(maLop) as soSV
from Khoa K,Lop L,SinhVien SV
where K.ma=L.maKhoa and L.Ma=SV.maLop and K.tenKhoa=N'công nghệ thông tin' 
group by SV.maLop,maKhoaHoc 

--5. Cho biết sinh viên khoa công nghệ thông tin, khóa 2002-2006 chưa học môn câu trúc dữ liệu 1
select hoTen
from SinhVien SV, Lop L,KhoaHoc KH
where SV.maLop= L.Ma and KH.ma=L.maKhoaHoc and KH.namBATDAU=2002 and KH.namKETTHUC=2006 and SV.Ma not in
(select maSinhVien 
from KetQua KQ, MonHoc MH
where KQ.maMonHoc=MH.Ma and MH.tenMonHoc=N'cấu trúc dữ liệu 1')

--6. Cho biết sinh viên thi không đậu( điểm thi <5) môn cấu trấu dữ liệu 1 nhưng chưa thi lại
select hoten
from MonHoc MH,SinhVien SV,KetQua KQ
where SV.Ma=KQ.maSINHVIEN and KQ.maMonHoc=MH.Ma and MH.tenMonHoc=N'cấu trúc dữ liệu 1' and KQ.diem <5 and KQ.lanthi=1

--7. Cho biết điểm trung bình của sinh viên mã số 0212003( điểm trung bình chỉ tính trên lần thi sau cùng của sinh viên)
select hoTen, AVG(diem) as diemTB
from SinhVien SV,KetQua KQ
where SV.Ma=KQ.maSINHVIEN and SV.Ma=0212003 and KQ.lanthi =(select MAX(lanthi) from KetQua) GROUP BY hoTen

--btvn8.cho biết điểm trung bình của tất cae sinh viên( điểm trung bình chỉ tính trên lần thi sau cùng của sinh viên )

select hoTen, AVG(Diem) diemtrungbinh
from SinhVien SV,KetQua KQ
where SV.Ma=KQ.maSINHVIEN and KQ.lanthi=
(select MAX(lanthi) from KetQua KQ1
where KQ.maSINHVIEN=KQ1.maSINHVIEN and KQ.maMonHoc=KQ1.maMonHoc
)
group by hoTen

-----------------------bài tập thực hành tuần 4----------------------------------------------------------------------
--1.tạo view V1 danh sách các sinh viên khoa " công nghệ thông tin''
create view V1
as
select SinhVien.Ma,SinhVien.hoTen,SinhVien.namSinh,SinhVien.dantoc,SinhVien.maLop
from SinhVien,lop,Khoa
where SinhVien.maLop =lop.Ma and Lop.maKhoa =Khoa.ma and Khoa.tenKhoa like N'công nghệ thông tin'
--2.tạo view V2 danh sách sinh viên khóa 2002-2006
create view V2
as
select SV.MA,SV.hoTen,SV.namSinh,SV.dantoc,SV.maLop
FROM SinhVien SV,Lop L,KhoaHoc KH
where L.Ma=SV.maLop AND L.maKhoaHoc =KH.ma AND KH.namBATDAU =2002 and KH.namKETTHUC =2006
select * 
from V2

--3.Tạo view V3 danh sách các môn mà chưa sinh viên nào theo học 
create view V3 
as 
select MH.tenMonHoc
from MonHoc MH
where Ma not in (select KetQua.maMonHoc from KetQua)

--4.tạo view V4 danh sách sinh viên thi đậu môn toán cao cấp A1
create view V4
as
select SV.Ma,SV.hoTen,SV.namSinh,SV.dantoc,SV.maLop,MH.tenMonHoc,MH.maKhoa,KQ.lanthi,KQ.diem
from SinhVien SV,KetQua KQ,MonHoc MH
WHERE SV.Ma=KQ.maSINHVIEN AND KQ.maMonHoc=MH.Ma AND MH.tenMonHoc =N'toán cao cấp A1' AND KQ.diem>=5
select *
from V4
--5.tìm sinh viên có điểm thi toán cao cấp A1 cao nhất từ view V4 
select top(1)*
from V4
order by V4.diem DESC

--6. đổi tên view V2 thành VSV02 
sp_rename V2,VSV02
select *
from VSV02

--7.ChuongTrinh.ma chỉ có thể là ‘CQ’ hoặc ‘CD’ hoặc ‘TC’ 
alter table ChuongTrinh
add constraint ck_maChuongTrinh
check (Ma in ('CQ','CD','TC'))

create rule r_CT as @Ma in ('CQ','CD','TC')
sp_bindrule 'r_CT','ChuongTrinh.ma'
drop rule r_CT

--8. Chỉ có 2 học kỳ là ‘HK1’ và ‘HK2’ 
alter table GiangKhoa
add constraint ck_GiangKhoa
check (hocKy in('1','2'))

--9. Số tiết lý thuyết (GiangKhoa.soTietLyThuyet) tối đa là 120 
alter table GiangKhoa
add constraint ck_soTietLyThuyet
check (soTietLyThuyet <120)

--10. Số tiết thực hành (GiangKhoa.soTietThucHanh) tối đa là 120

 alter table GiangKhoa
add constraint ck_soTietThucHanh
check (soTietThucHanh <120)

 create rule r_TH as @soTcHanh <120
 sp_bindrule 'r_Th','GiangKhoa.soTietThucHanh'


 --11. Số tín chỉ (GiangKhoa.soTinChi) của một môn học tối đa là 6 
 create rule r_TC as @soTinChi <6
 sp_bindrule 'r_TC','GiangKhoa.soTinChi'

 alter table GiangKhoa
 add constraint ck_soTinChi
 check (soTinChi <6)


 --12. Điểm thi (KetQua.diem) được chấm theo thang điểm 10, chính xác đến 1 chữ số sau dấu phẩy)
 
create rule r_diemKQ as @diem >= 0 and @diem <=10 and @diem= round(@diem,1)
 sp_bindrule 'r_diemKQ','KetQua.diem'

 alter table KetQua
 add constraint chk_diem
 check (diem >=0 and diem <=10 and diem= round(diem,1))

--7.Chuongtrinh.ma chỉ có thể là 'CQ' hoặc 'CD' hoặc 'TC'
alter table Chuongtrinh
add constraint CK_CT
check(Ma in('CQ', 'CD','TC'))
insert into ChuongTrinh
values('AB','vi du')
--8.chỉ có 2 học kỳ là 'HK1' VÀ 'HK2'
alter table GiangKhoa
add constraint CK_HK
check (hocky in(1,2))
insert into GiangKhoa values('CQ','CNTT','THT01',2003,3,60,0,5)

--10.số tiết thực hành (giangkhoa.sotietthuchanh) tối đa là 120 
create rule STTH
as  @STTH <=120

SP_BINDRULE 'STTH','GiangKhoa.soTietThucHanh'

--11.số tín chỉ(giangkhoa.sotinchi) của một môn học tối đa là 6

-----------------------------BTVN những câu làm bằng rule thì làm bằng check những câu làm bằng check thì làm bằng rule-----------------------------


--7b. Tao rule ChuongTrinh.ma chỉ có thể là ‘CQ’ hoặc ‘CD’ hoặc ‘TC’ 
alter rule r_CT as @Ma in ('CQ','CD','TC')
sp_bindrule 'r_CT','ChuongTrinh.ma'
 
 --8b. tao rule Chỉ có 2 học kỳ là ‘HK1’ và ‘HK2’ 
 create rule r_HK as @hocKy in ('1','2')
 sp_bindrule 'r_HK','GiangKhoa.hocKy'

 --9b. tao rule Số tiết lý thuyết (GiangKhoa.soTietLyThuyet) tối đa là 120
 create rule r_LT as @soTietLyThuyet <120
 sp_bindrule 'r_LT','GiangKhoa.soTietLyThuyet'

--7b.ChuongTrinh.ma chỉ có thể là ‘CQ’ hoặc ‘CD’ hoặc ‘TC’ (tạo bằng rule)
create rule Ma_CT
as @Ma_CT in ('CQ','CD','TC')
sp_bindrule 'Ma_CT','ChuongTrinh.Ma'

--8b.Chỉ có 2 học kỳ là ‘HK1’ và ‘HK2’ (tạo bằng rule)
create rule HK
as @HK in (1,2)
sp_bindrule 'HK','GiangKhoa.hocky'

--9b.Số tiết lý thuyết (GiangKhoa.soTietLyThuyet) tối đa là 120 
create rule sotietLT
as @sotietLT <= 120
sp_bindrule 'sotietLT','GiangKhoa.soTietLyThuyet'

--10b. Số tiết thực hành (GiangKhoa.soTietThucHanh) tối đa là 120(tạo bằng check)
alter table GiangKhoa
add constraint GiangKhoa_soTietThucHanh
check (soTietThucHanh <=120)

--11b.Số tín chỉ (GiangKhoa.soTinChi) của một môn học tối đa là 6(tạo bằng check)
alter table GiangKhoa
add constraint GiangKhoa_soTinChi
check (soTinChi <=6)

--12b.Điểm thi (KetQua.diem) được chấm theo thang điểm 10, chính xác đến 1 chữ số sau dấu phẩy)(tạo bằng check)
alter table KetQua
add constraint KetQua_diem
check (diem=round(diem,1) and diem between 0 and 10)

-----------------------------------BÀI TẬP THỰC HÀNH TUẦN 5----------------------------------------------------------
--ví dụ: tạo procedure in tenmonhoc, tham số đầu vào @maMon
create procedure inTenMonHoc (@maMon Varchar(10))
as
begin 
--khai báo biến @tenmon
declare @tenMon nvarchar(100)
--tìm tên môn học ứng với @maMon
--sau đó gán giá trị vừa tìm được cho @tenMon
select @tenMon=tenMonHoc 
from MonHoc
where Ma=@maMon
--intenmonhoc ra màn hình 
print N'tên môn học là'+ @tenMon
end
--thực thi procedure 
execute inTenMonHoc 'THT01' 

--1.In danh sách các sinh viên của một lớp học(mã lớp là tham số đầu vào)
create procedure DSSV (@maLop varchar(10))
as
begin
select *
from SinhVien
where maLop=@maLop
end 
execute DSSV 'TH2002/01'
--drop procedure DSSV

--2. Nhập vào 2 sinh viên, 1 môn học, tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên là cao hơn.
ALter procedure sosanhdiem(@ms1 varchar(10), @ms2 varchar(10), @maMon varchar(10))
as 
begin
	declare @diem1 float
	declare @diem2 float
	--set @diem1=0
	--set @diem2=0
	select @diem1 = diem
	from KetQua
	where maMonHoc=@maMon and maSinhVien=@ms1 and lanThi=1
	select @diem2 = diem
	from KetQua
	where maMonHoc=@maMon and maSinhVien=@ms2 and lanThi=1
	print str(@diem1) + str(@diem2)
	if ((@diem1>0) and (@diem2>0))
	begin
		if @diem1>@diem2
			print N'Sinh viên 1 có điểm cao hơn' 
		else if @diem1<@diem2
			print N'Sinh viên 2 có điểm cao hơn'
		else 
			 print N'Điểm hai sinh viên bằng nhau'

	end
	else
		print N'Ko có điểm để xét'
	end
	select* 
	from KetQua
exec sosanhdiem '212001','212003','THT01'


--3. Nhập vào 1 môn học và 1 mã sv,  kiểm tra xem sinh viên có đậu môn này trong lần thi đầu tiên không, nếu đậu thì xuất ra là “Đậu”, không thì xuất ra “Không đậu”
create procedure kiemtrasinhvien(@maMH varchar(10),@maSV varchar(10))
as
begin
declare @hoten nvarchar(100),@kq float
select @hoten=hoTen, @kq=diem
from SinhVien SV, KetQua KQ
where SV.Ma=KQ.maSINHVIEN and KQ.maMonHoc= @maMH and SV.Ma=@maSV and KQ.lanthi =1
if (@kq>= 5)
print N'sinh Viên ' +@hoten+ N'Đậu'
else
print N'sinh viên ' +@hoten +N'không đậu'
END 
execute kiemtrasinhvien 'THCS01',0212002
DROP PROCEDURE kiemtrasinhvien

--4. Nhập vào 1 khoa, in danh sách các sinh viên (mã sinh viên, họ tên, ngày sinh) thuộc khoa này.
create procedure danhsachSV (@makhoa varchar(10))
as
begin 
select SV.Ma, SV.hoTen,SV.namSinh
from SinhVien SV,Khoa k,Lop L
where SV.maLop=L.Ma AND L.maKhoa=k.ma AND K.ma=@makhoa
end 
execute danhsachSV 'CNTT'
--drop procedure danhsachSV

--5.Nhập vào 1 sinh viên và 1 môn học, in điểm thi của sinh viên này của các lần thi môn học đó.
ALTER procedure diemthiSV(@maSV varchar(10),@maMonHoc varchar(10))
as
begin
select KQ.diem,KQ.lanthi,SV.hoTen 
from KetQua KQ,SinhVien SV
where SV.Ma =KQ.maSINHVIEN AND KQ.maMonHoc=@maMonHoc AND KQ.maSINHVIEN=@maSV
END 
EXECUTE diemthiSV 0212001,'THT01'

--6.Nhập vào 1 sinh viên, in ra các môn học mà sinh viên này phải học.
create procedure TraCuuMH (@maSV varchar(10))
as
Begin		
			select MH.tenMonHoc
			from MonHoc MH, Sinhvien SV, Lop L, Khoa K
			where SV.Ma=@maSV and L.maKhoa=K.ma and L.Ma=SV.maLop and MH.maKhoa=K.ma
End
			
drop procedure TraCuuMH
execute TraCuuMH 0212001

---------------------BÀI TẬP VỀ NHÀ--------------------------
--Câu 7: Nhập vào 1 môn học, in danh sách các sinh viên đậu môn này trong lần thi đầu tiên.

CREATE PROCEDURE DSdau @tenMH NVARCHAR(100)
AS
BEGIN
SELECT  SV.Ma,SV.hoTen,KQ.diem
 from SinhVien SV, KetQua KQ,MonHoc MH
WHERE KQ.maMonHoc=MH.Ma and SV.Ma=KQ.maSinhVien and KQ.lanthi=1 and KQ.diem >=5 and MH.tenMonHoc=@tenMH
END
EXECUTE DSdau N'Toán rời rạc'
drop procedure DSdau

--Câu 8: In điểm các môn học của sinh viên có mã số là maSinhVien được nhập vào.(Chú ý: điểm của môn học là điểm thi của lần thi sau cùng) 
--Chỉ in các môn đã có điểm

CREATE PROCEDURE diemSV @maSinhVien VARCHAR(10)
AS
BEGIN
SELECT MH.tenMonHoc,KQ.diem 
FROM MonHoc MH,KetQua KQ 
WHERE KQ.maMonHoc=MH.Ma and KQ.maSinhVien=@maSinhVien
and KQ.lanthi =(SELECT max(KQ2.lanthi)
FROM KetQua KQ2
WHERE KQ2.maSinhVien=@maSinhVien and KQ2.maMonHoc=MH.Ma)
END
EXECUTE diemSV 0212003
drop procedure diemSV
------------------------------BÀI TẬP THỰC HÀNH TUẦN 6---------------------
--1.Với 1 mã sinh viên và 1 mã khoa, kiểm tra xem sinh viên có thuộc khoa này không (trả về 0 hoặc 1)
---cách 1:
ALTER function kiemtraSV(@maSV varchar(10),@maKhoa varchar(10))
returns int 
begin 
declare @maK varchar(10),@kq int 
select @maK = maKhoa
from SinhVien SV,lop L
where @maSV=SV.Ma and SV.maLop =L.Ma 
if @maK =@maKhoa
set @kq=1
else 
set @kq=0
return @kq
end

--cách 2:
create function kiem_tra(@MSV varchar(10),@MK varchar(10))
returns int 
begin
declare @KQ int 
if @MSV in(select SinhVien.Ma 
           from SinhVien,Lop
		   where Lop.Ma = SinhVien.maLop and @MK =Lop.maKhoa)
		   set @kq=1
else 
           set @KQ =0
		   return @KQ
end

--2.Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
create function diemthiTB(@maSV varchar(10),@maMH varchar(10))
returns float
begin
declare @diem float 
select @diem=KQ.diem
from KetQua KQ
where KQ.maSINHVIEN=@maSV and KQ.maMonHoc = @maMH and KQ.lanthi=(select MAX(K.lanthi)
                                                               from KetQua K
															   where KQ.maSINHVIEN =K.maSINHVIEN and 
															   K.maMonHoc=KQ.maMonHoc)
return @diem
END
select dbo.diemthiTB(0212002,'THT01')  ---chạy riêng

--3.Tính điểm trung bình của một sinh viên (chú ý : điểm trung bình được tính dựa trên lần thi sau cùng), sử dụng function ở câu 2 đã viết
alter function CAU3(@maSV varchar(10))
returns float 
as
begin
declare @TB float
select @TB= AVG(BANGDIEM.KQdiem)
from (select dbo.diemthiTB(@maSV,KQ.mamonHoc) as KQdiem
FROM KetQua KQ
where KQ.maSINHVIEN =@maSV) as BANGDIEM
return @TB
end 
select dbo.CAU3(0212004) --chạy riêng

--4.Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó. 
create function diemthi(@maSinhVien varchar(10),@maMH varchar(10))
returns table as
return(
select KQ.diem,KQ.lanthi
from KetQua KQ 
WHERE KQ.MaSinhvien= @maSinhVien and KQ.maMonHoc=@maMH)
select *            ---chạy sau
from dbo.diemthi(0212002,'THT01')

--câu 5.Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải học.
create function DSMonHoc(@MH varchar(10))
returns table 
as
return(
select DISTINCT tenMonHoc
from MonHoc MH,KetQua KQ,SinhVien SV
where MH.Ma=KQ.maMonHoc AND KQ.maSINHVIEN = SV.Ma AND SV.Ma=@MH)
select *                   --chạy sau
FROM dbo.DSMonHoc(0212002)


  
