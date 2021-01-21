CREATE DATABASE QLSV
USE QLSV 
DROP TABLE GIANGKHOA 
CREATE TABLE KHOA
(
ma varchar(10) PRIMARY KEY,
tenKhoa NVARCHAR(100) not null,
namThanhLap INT not null,
)
CREATE TABLE KHOAHOC
(
ma VARCHAR(10) PRIMARY KEY,
namBatDau INT not null,
namKetThuc INT not null,
)
CREATE TABLE SINHVIEN
(
ma VARCHAR(10) PRIMARY KEY,
hoTen NVARCHAR(100) not null,
namSinh INT not null,
danToc Nvarchar(20) not null,
maLop VARCHAR(10) not null,
)
CREATE TABLE CHUONGTRINH
(
ma VARCHAR(10) PRIMARY KEY,
tenChuongTrinh NVARCHAR(100) not null,
)
CREATE TABLE MONHOC 
(
ma VARCHAR(10) PRIMARY KEY,
tenMonHoc NVARCHAR(100) not null,
maKhoa VARCHAR(10) not null,
)
CREATE TABLE KETQUA
(
maSinhVien VARCHAR(10),
maMonHoc VARCHAR(10) ,
lanthi INT not null,
diem FLOAT not null,
PRIMARY KEY(maSinhVien,maMonHoc)
)
CREATE TABLE GIANGKHOA 
(
maChuongTrinh VARCHAR(10) ,
maKhoa VARCHAR(10) ,
maMonHoc VARCHAR(10) ,
namhoc INT not null,
hocKy INT not null,
soTietLyThuyet INT not null,
soTietThucHanh INT not null,
soTinChi INT not null,
PRIMARY KEY(maChuongTrinh,maKhoa,maMonHoc)
)
CREATE TABLE LOP
(
ma VARCHAR(10) PRIMARY KEY,
maKhoaHoc VARCHAR(10) not null,
maKhoa VARCHAR(10) not null,
maChuongTrinh VARCHAR(10) not null,
soThuTu INT not null,
)

ALTER TABLE KETQUA ADD CONSTRAINT FK_KETQUA_SINHVIEN FOREIGN KEY (maSinhVien) REFERENCES SINHVIEN(Ma)
ALTER TABLE KETQUA ADD CONSTRAINT FK_KETQUA_MONHOC FOREIGN KEY (maMonHoc) REFERENCES MONHOC(Ma)
ALTER TABLE GIANGKHOA ADD CONSTRAINT FK_GIANGKHOA_CHUONGTRINH FOREIGN KEY (maChuongTrinh) REFERENCES CHUONGTRINH(Ma)
ALTER TABLE GIANGKHOA ADD CONSTRAINT FK_GIANGKHOA_KHOA FOREIGN KEY (maKhoa) REFERENCES KHOA(ma)
ALTER TABLE MONHOC ADD CONSTRAINT FK_MONHOC_KHOA FOREIGN KEY (maKhoa) REFERENCES KHOA(ma)
ALTER TABLE GIANGKHOA ADD CONSTRAINT FK_GIANGKHOA_MONHOC FOREIGN KEY (maMonHoc) REFERENCES MONHOC(MA)
ALTER TABLE LOP ADD CONSTRAINT FK_LOP_KHOAHOC FOREIGN KEY (maKhoaHoc) REFERENCES KHOAHOC(ma)
ALTER TABLE LOP ADD CONSTRAINT FK_LOP_CHUONGTRINH FOREIGN KEY (maChuongTrinh) REFERENCES CHUONGTRINH(Ma)
ALTER TABLE LOP ADD CONSTRAINT FK_LOP_KHOA FOREIGN KEY (maKhoa) REFERENCES KHOA(ma)
ALTER TABLE SINHVIEN ADD CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (maLop) REFERENCES Lop(Ma)

INSERT INTO KHOA values ('CNTT',N'công nghệ thông tin',1995)
INSERT INTO KHOA VALUES ('VL',N'Vật lý',1970)

insert into KHOAHOC values('K2002',2002,2006)
insert into KHOAHOC values('K2003',2003,2007)
insert into KHOAHOC values('k2004',2003,2008)

insert into CHUONGTRINH values('CQ',N'chính quy')

insert into MONHOC values ('THT01',N'Toán cao cấp A1','CNTT')
insert into MONHOC values('VLT01',N'vật lý cao cấp A1','VL')
insert into MONHOC values ('THT02',N'toán rời rạc','CNTT')
insert into MONHOC values ('THCS01',N'Cấu trúc dữ liệu 1','CNTT ')
insert into MONHOC values ('THCS02',N'hệ điều hành','CNTT')

insert into LOP values ('TH2002/01','K2002','CNTT','CQ',1)
insert into LOP values ('TH2002/01','K2002','CNTT','CQ',2)
insert into LOP values ('TH2003/01','K2003','VL','CQ',1)

insert into SINHVIEN values('0212001',N'Nguyễn Vĩnh An',1984,'kinh','TH2002/01')
insert into SINHVIEN values('0212002',N'Nguyễn Thanh Bình',1985,'kinh','TH2002/01')
insert into SINHVIEN values('0212003',N'Nguyễn Thanh Cường',1984,'Kinh','TH2002/01')
insert into SINHVIEN values('0212004',N'Nguyễn Quốc Duy',1983,'Kinh','TH2002/01')
insert into SINHVIEN values('0312001',N'Phan Tuấn Anh',1985,'kinh','TH2003/01')
insert into SINHVIEN values ('0312002',N'Huỳnh Thanh Sang',1984,'kinh','TH2003/01')

insert into KETQUA values('0212001','THT01',1,4)
insert into KETQUA values('0212001','THT01',1,7)
insert into KETQUA values('0212002','THT01',1,8)
insert into KETQUA values('0212003','THT01',1,6)
insert into KETQUA values('0212004','THT01',1,9)
insert into KETQUA values ('0212001','THT02',1,8)
insert into KETQUA values('0212002','THT02',1,5.5)
insert into KETQUA values('0212003','THT02',1,4)
insert into KETQUA values('0212003','THT02',2,6)
insert into KETQUA values ('0212001','THCS01',1,6.5)
insert into KETQUA values('0212002','THCS01',1,4)
insert into KETQUA values ('0212003','THCS01',1,7)

insert into GIANGKHOA values('CQ','CNTT','THT01',2003,1,60,0,5)
insert into GIANGKHOA values('CQ','CNTT','THT02',2003,2,45,0,4)
insert into GIANGKHOA values('CQ','CNTT','THCS01',2004,1,45,30,4)

--xuất ra các bảng:
select *from SINHVIEN 
select *from KETQUA
select *from LOP
select *from CHUONGTRINH
select *from GIANGKHOA
select *from MONHOC
select *from KHOAHOC


 


--danh sách các sinh viên khoa công nghệ thông tin 
select  *
from LOP,KHOA,SINHVIEN 
where  SinhVien.maLop=lop.Ma and Lop.maKhoa=Khoa.ma and tenKhoa=N'công nghệ thông tin'
--danh sách sinh viên khóa 2002-2006 
select *
from SINHVIEN,LOP,KHOAHOC
where SINHVIEN.maLop=LOP.ma AND LOP.maKhoaHoc=KHOAHOC.ma AND namBatDau=2002 AND namKetThuc =2006
--danh sách các sinh viên thi đậu(điểm thi >=5) môn toán cao cấp A1
select *
from SINHVIEN,MONHOC,KETQUA
where SINHVIEN.ma=KETQUA.maSinhVien AND MONHOC.ma=KETQUA.maMonHoc AND tenMonHoc=N'toán cao cấp A1' AND diem>=5
--liệt kê những sinh viên có họ là 'nguyễn'và đã học môn toán rời rạc 
select *
from SINHVIEN,MONHOC,KETQUA
where SINHVIEN.ma=KETQUA.maSinhVien AND KETQUA.maMonHoc=MONHOC.ma AND tenMonHoc=N'toán rời rạc' AND SINHVIEN.hoTen like N'Nguyễn %'
--liệt kê tên các khoa đã thành lập hơn 15 năm 
select tenKhoa
from  KHOA
where YEAR(getdate()) - namThanhLap >15
--cho biết các sinh viên(MSSV,họ tên, năm sinh) học sớm hơn tuổi quy định (theo tuổi quy đinh thì sinh viên đủ 18 khi bắt đầu khóa học)
select SV.ma,SV.hoTen,SV.namSinh
from SINHVIEN SV,KHOAHOC KH,LOP L
where SV.maLop =L.ma AND L.maKhoaHoc = KH.ma AND KH.namBatDau-SV.namSinh < 18
--Cho biết hai sinh viên có điểm thi toán cao cấp A1 cao nhất 
select TOP(2) SV.hoten,KQ.diem
from SINHVIEN SV, KETQUA KQ,MONHOC MH
WHERE MH.ma =KQ.maMonHoc AND KQ.maSinhVien=SV.ma AND MH.tenMonHoc =N'toán cao cấp A1'
ORDER BY KQ.diem DESC

--câu 1: tạo view v1 danh sách các sinh viên khoa công nghệ thông tin 
CREATE VIEW V1
as
select SINHVIEN.ma,SINHVIEN.hoTen,SINHVIEN.namSinh,SINHVIEN.danToc,SINHVIEN.maLop
from SINHVIEN, LOP, KHOA
where SINHVIEN.maLop =LOP.ma AND LOP.maKhoa = KHOA.ma AND KHOA.tenKhoa like N'công nghệ thông tin'
--câu 2: tạo view V2 danh sách các sinh viên khóa 2002-2006
CREATE VIEW V2
as
select SV.ma, SV.hoTen,SV.namSinh,SV.danToc,SV.maLop
from KHOAHOC KH,SINHVIEN SV,LOP L
where L.ma=SV.maLop AND L.maKhoaHoc =KH.ma AND KH.namBatDau=2002 AND KH.namKetThuc=2006
select *from V2
--câu 3:tạo view V3 danh sách các môn mà chưa sinh viên nào theo học 
CREATE VIEW V3
AS
SELECT MONHOC.tenMonHoc
FROM MONHOC
WHERE ma NOT IN (SELECT KETQUA.maMonHoc FROM KETQUA)
--câu 4:tạo view V4 danh sách sinh viên thi đậu môn toán cao cấp A1
CREATE VIEW V4
AS 
SELECT SV.ma,SV.hoTen,SV.namSinh,SV.danToc,SV.maLop,MH.tenMonHoc, MH.maKhoa,KQ.lanthi,KQ.diem
FROM SINHVIEN SV,KETQUA KQ,MONHOC MH
WHERE SV.ma =KQ.maSinhVien AND KQ.maMonHoc =MH.ma AND MH.tenMonHoc =N'TOÁN CAO CẤP A1' AND KQ.DIEM>=5
SELECT *FROM V4
--câu 5:tìm sinh viên có điểm thi toán cao cấp a1 cao nhất từ view 4
SELECT TOP(1)*
FROM  V4
ORDER BY V4.DIEM DESC 

--câu 6:đổi tên view V2 thành VSV02
sp_rename V2, VSV02
select *from VSV02 
--CÂU 7: ChuongTrinh.ma chỉ có thể là 'CQ' hoặc 'CD' hoặc 'TC' 
alter table ChuongTrinh
add constraint ck_maChuongTrinh
create rule r_CT as @Ma in ('CQ','CD','TC')
sp_bindrule 'r_CT', 'ChuongTrinh.ma'
drop rule r_CT
insert into CHUONGTRINH values('vd',N' ví dụ')
--câu 8: chỉ có 2 học kỳ là hk1 và hk2
alter table GIANGKHOA
add constraint ck_hocky
check (hocky in (1,2))
insert into GIANGKHOA values('CQ','CNTT','THT01',2003,3,60,0,5)

--câu 9: số tiết lý thuyết (GIANGKHOA.sotietlythuyet) tối đa là 120
alter table GIANGKHOA
add constraint CK_1
check sotietlythuyet<120
create rule r_1
as @GIANGKHOA.sotietlythuyet< 120
sp_bindrule 'r_1','GIANGKHOA.sotietlythuyet'

--câu 10 số tiết thực hành (GIANGKHOA.sotietThucHanh) tối đa là 120
alter table GIANGKHOA
ADD CONSTRAINT CK_1
CHECK sotietThucHanh <120
create rule r_2 as @GIANGKHOA.sotietThucHanh<120
sp_bindrule 'r_2','GIANGKHOA.sotietThucHanh'

--câu 12
create rule r_diemKQ  as  @diem>=0 and @diem <= 10 and @diem = round(@diem,1)
sp_bindrule 'r_diemKQ','KETQUA.diem'

--tạo procudure in tenMonHoc, tham số đầu vào @maMon
CREATE PROCEDURE InTenMonHoc (@maMon varchar(10) )
AS 
BEGIN 
declare @tenMon nvarchar(100)                       --khai báo biến @tenMon
select @tenMon = tenMonHoc                           --tìm tên môn học ứng vơi @maMon
from MonHoc                                          
where Ma= @maMon                                      --sau đó gán giá trị vừa tìm được cho @tenMon
PRINT N'TÊN MÔN HỌC LÀ' + @tenMon                      -- in tên môn học ra màn hình 
end
execute InTenMonHoc   'THT01'                         -- thực thi procedure 

--câu 1:in danh sách sinh viên của một lớp học( mã lớp là tham số đầu vào)
create procedure danhsachsinhvien (@maLop varchar(10))
as
begin
declare @TenSV nvarchar(100)
select @TenSV =HOTEN
from SINHVIEN 
where maLop =@maLop
PRINT N'danh sách sinh vien là' +@tenSV
end 
execute danhsachsinhvien 'TH2002/01'
--câu 2:nhập vào hai sinh viên,1 môn học, tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên cao hơn 
create procedure SoSanhSV (@maSV1 varchar(10), @maSV2 varchar(10), @maMH varchar(10))
as
Begin		
declare @hoTen1 nvarchar(100), @kq1 int, @hoTen2 nvarchar(100), @kq2 int
Begin	
			select @hoTen1=hoTen, @kq1=diem
			from
			Sinhvien SV, KetQua KQ
			where 
				KQ.maSinhVien=SV.Ma and KQ.maMonHoc=@maMH and KQ.maSinhVien=@maSV1 and KQ.lanThi=1
End
Begin
			select @hoTen2=hoTen, @kq2=diem
			from
			Sinhvien SV, KetQua KQ
			where 
				KQ.maSinhVien=SV.Ma and KQ.maMonHoc=@maMH and KQ.maSinhVien=@maSV2 and KQ.lanThi=1
End
If @kq1>@kq2
print N'Sinh vien diem cao hon la: ' + @hoTen1
else
print N'Sinh vien diem cao hon la: ' + @hoTen2
End
			
drop procedure SoSanhSV
execute SoSanhSV '0212001','0212002','THT01'

--câu 3:nhập vào một môn học, kiểm tra xem sinh viên có đậu môn này trong lần thi đầu tiên không,nếu đậu xuất ra là "đậu" nếu không thì xuất ra "không đậu" 
create procedure KTdaurot (@maMH varchar(10), @maSV varchar(10))
as
Begin		
			declare @hoTen nvarchar(100), @kq float
			select @hoTen=hoTen, @kq=diem
			from
			Sinhvien SV, KetQua KQ
			where 
				KQ.maSinhVien=SV.Ma and KQ.maMonHoc=@maMH and KQ.maSinhVien=@maSV and KQ.lanThi=1
End

If @kq>=5
print N'Sinh vien ' + @hoTen + N' đã ĐẬU!'
else
print N'Sinh vien ' + @hoTen + N' rớt mất tiêu rồi!'
			
drop procedure KTdaurot
execute KTdaurot 'THCS01','0212002'
--câu 4: nhập vào một khoa in danh sách in danh sách các sinh viên(mã sinh viên, họ tên, ngày sinh) thuộc khoa này 
create procedure DSSV_Khoa (@maKhoa varchar(10))
as
Begin
	select SV.Ma, SV.hoTen, SV.namSinh, SV.danToc
	from Sinhvien SV, Khoa K, Lop L
	where K.ma=@maKhoa and L.maKhoa=K.ma and L.Ma=SV.maLop
End

execute DSSV_Khoa 'CNTT'
--câu 5: nhập vào sinh viên và một môn học, in điểm thi của sinh viên này của các lần thi môn học đó 
create procedure TTthicu (@maSV varchar(10), @maMH varchar(10))
as
Begin		
			select KQ.lanThi, KQ.diem
			from
			Sinhvien SV, KetQua KQ
			where 
				KQ.maSinhVien=SV.Ma and KQ.maMonHoc=@maMH and KQ.maSinhVien=@maSV
End
			
drop procedure TTthicu
execute TTthicu '0212001','THT01'
--câu 6: nhập vào một sinh viên , in ra các môn học mà sinh viên đó phải học 
create procedure tracuuMH(@maSinhVien varchar(10))
as
begin 
            select MH.tenMonHoc
			from  MONHOC MH,SINHVIEN SV,LOP L,KHOA K  
			where SV.ma=@maSinhVien AND L.maKhoa =k.ma AND L.ma=SV.maLop AND MH.maKhoa=K.ma
end
drop procedure tracuuMH
execute tracuuMH '0212001'
--câu 7: nhập vào một môn học, in danh sách các sinh đậu môn này trong lần thi đầu tiên 
create procedure thidaulandau (@maMH varchar(10))
as
begin 
            select SV.hoten
			from SINHVIEN SV, KETQUA KQ
			where KQ.maSinhVien=SV.ma AND KQ.maMonHoc=@maMH AND KQ.lanthi=1 AND KQ.diem>5
end 
drop procedure thidaulandau
execute thidaulandau 'THT01' 
--Câu 8: 8.	In điểm các môn học của sinh viên có mã số là maSinhVien được nhập vào.	
--(Chú ý: điểm của môn học là điểm thi của lần thi sau cùng) Chỉ in các môn đã có điểm
create procedure indiemMH (@maSV varchar(10))
as
begin 
            select MH.tenMonHoc, KQ.diem
			from MONHOC MH,KETQUA KQ, SINHVIEN SV
			where SV.ma=KQ.maSinhVien AND KQ.maMonHoc=MH.ma AND SV.ma=@maSV AND 
			KQ.lanthi=( select MAX(KQtam.lanthi)
			from KETQUA KQtam
			where KQ.maSinhVien=KQtam.maSinhVien AND KQ.maMonHoc=KQtam.maMonHoc)
end
drop procedure indiemMH
execute indiemMH '0212002'



