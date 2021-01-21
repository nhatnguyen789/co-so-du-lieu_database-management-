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