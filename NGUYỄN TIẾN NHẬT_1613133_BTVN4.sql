---------------------BÀI TẬP VỀ NHÀ--------------------------
--Câu 7: Nhập vào 1 môn học, in danh sách các sinh viên đậu môn này trong lần thi đầu tiên.

CREATE PROCEDURE DSdau @tenMH NVARCHAR(100)
AS
BEGIN
SELECT hoTen FROM SinhVien, KetQua,MonHoc 
WHERE KetQua.maMonHoc=MonHoc.Ma and SinhVien.Ma=KetQua.maSinhVien and lanthi=1 and diem >=5 and tenMonHoc=@tenMH
END
EXECUTE DSdau N'Toán rời rạc'

--Câu 8: In điểm các môn học của sinh viên có mã số là maSinhVien được nhập vào.(Chú ý: điểm của môn học là điểm thi của lần thi sau cùng) 
--Chỉ in các môn đã có điểm

CREATE PROCEDURE diemSV @maSinhVien VARCHAR(10)
AS
BEGIN
SELECT tenMonHoc,diem FROM MonHoc,KetQua WHERE KetQua.maMonHoc=MonHoc.Ma and KetQua.maSinhVien=@maSinhVien
and lanthi =(SELECT max(KQ2.lanthi)
FROM KetQua KQ2
WHERE KQ2.maSinhVien=@maSinhVien and KQ2.maMonHoc=MonHoc.Ma)
END
EXECUTE diemSV '0212003'
