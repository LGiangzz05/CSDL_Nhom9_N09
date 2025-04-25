-- Tạo bảng
CREATE TABLE Chuong_trinh_dao_tao
(
  Ma_chuong_trinh_dao_tao Nvarchar(10) NOT NULL,
  Ten_chuong_trinh_dao_tao Nvarchar(70) NOT NULL,
  So_tin_chi_can_de_tot_nghiep INT  NULL,
  Nam_bat_dau INT  NULL,
  PRIMARY KEY (Ma_chuong_trinh_dao_tao)
);

CREATE TABLE Sinh_vien
(
  Ma_sinh_vien Nvarchar(10) NOT NULL,
  Ho Nvarchar(10)  NOT NULL,
  Dem Nvarchar(20) NOT NULL,
  Ten Nvarchar(10) NOT NULL,
  Ngay_sinh Datetime  NULL,
  Nam_nhap_hoc INT NULL,
  Gioi_tinh Nvarchar(10)  NULL,
  Ma_chuong_trinh_dao_tao Nvarchar(10)  NULL,
  PRIMARY KEY (Ma_sinh_vien),
  FOREIGN KEY (Ma_chuong_trinh_dao_tao) REFERENCES Chuong_trinh_dao_tao(Ma_chuong_trinh_dao_tao)
);

CREATE TABLE Giang_vien
(
  Ma_giang_vien Nvarchar(10) NOT NULL,
  Ho_va_ten Nvarchar(50) NOT NULL,
  Ngay_thang_nam_sinh Datetime  NULL,
  Hoc_vi Nvarchar(20)  NULL,
  Thoi_gian_bat_dau_cong_tac Int  NULL,
  PRIMARY KEY (Ma_giang_vien)
);

CREATE TABLE Hoc_phan
(
  Ma_hoc_phan Nvarchar(10) NOT NULL,
  Ten_hoc_phan Nvarchar(50) NOT NULL,
  So_tin_chi INT  NULL,
  Loai Nvarchar(10)  NULL,
  Ty_le_diem_qua_trinh Int  NULL,
  Ty_le_diem_qua_thi Int  NULL,
  PRIMARY KEY (Ma_hoc_phan)
);

CREATE TABLE Lop_hoc_phan
(
  Nam_hoc Nvarchar(15) NULL,
  Dot_hoc Nvarchar(30)  NULL,
  Ma_lop_hoc_phan Nvarchar(10) NOT NULL,
  So_luong_sinh_vien INT  NULL,
  Ten_lop_hoc_phan Nvarchar(50) NOT NULL,
  Ma_hoc_phan Nvarchar(10)  NULL,
  Ma_giang_vien Nvarchar(10)  NULL,
  PRIMARY KEY (Ma_lop_hoc_phan),
  FOREIGN KEY (Ma_hoc_phan) REFERENCES Hoc_phan(Ma_hoc_phan),
  FOREIGN KEY (Ma_giang_vien) REFERENCES Giang_vien(Ma_giang_vien)
);

CREATE TABLE Bao_gom
(
  Thuoc_hoc_ky Nvarchar(10)  NULL,
  Ma_hoc_phan Nvarchar(10) NOT NULL,
  Ma_chuong_trinh_dao_tao Nvarchar(10) NOT NULL,
  PRIMARY KEY (Ma_hoc_phan, Ma_chuong_trinh_dao_tao),
  FOREIGN KEY (Ma_hoc_phan) REFERENCES Hoc_phan(Ma_hoc_phan),
  FOREIGN KEY (Ma_chuong_trinh_dao_tao) REFERENCES Chuong_trinh_dao_tao(Ma_chuong_trinh_dao_tao)
);

  CREATE TABLE Hoc
(
  Diem_qua_trinh FLOAT  NULL,
  Diem_thi FLOAT  NULL,
  Ma_lop_hoc_phan Nvarchar(10) NOT NULL,
  Ma_sinh_vien Nvarchar(10) NOT NULL,
  PRIMARY KEY (Ma_lop_hoc_phan, Ma_sinh_vien),
  FOREIGN KEY (Ma_lop_hoc_phan) REFERENCES Lop_hoc_phan(Ma_lop_hoc_phan),
  FOREIGN KEY (Ma_sinh_vien) REFERENCES Sinh_vien(Ma_sinh_vien)
);

-- Insert
USE QUANLYSINHVIEN

INSERT INTO Chuong_trinh_dao_tao (Ma_chuong_trinh_dao_tao, Ten_chuong_trinh_dao_tao, So_tin_chi_can_de_tot_nghiep, Nam_bat_dau) 
VALUES 
(N'7580206QT', N'Chương trình chất lượng cao Cầu đường bộ Việt-Pháp', 183, '2021'),
(N'7480201QT', N'Chương trình chất lượng cao Công nghệ thông tin Việt-Anh', 183, '2022'),
(N'7520103QT', N'Chương trình chất lượng cao Cơ khí ô tô Việt-Anh', 183, '2021'),
(N'7340301QT', N'Chương trình chất lượng cao Kế toán tổng hợp Việt-Anh', 140, '2022'),
(N'7340101QT', N'Chương trình chất lượng cao Quản trị kinh doanh Việt-Anh', 140, '2022'),
(N'7580201QT', N'Kỹ thuật xây dựng công trình giao thông', 183, '2021'),
(N'7480205', N' Công nghệ thông tin ', 183, '2022'),
(N'7580204QT',N'Chương trình chất lượng cao Cầu đường bộ Việt-Anh', 183, '2022'),
(N'7340302', N'Quản trị kinh doanh', 140, '2022'),
(N'7340102QT', N'Chương trình chất lượng cao Quản trị kinh doanh Việt-Anh', 140, '2022');

INSERT INTO Sinh_vien (Ma_sinh_vien, Ho, Dem, Ten, Ngay_sinh, Nam_nhap_hoc, Gioi_tinh, Ma_chuong_trinh_dao_tao) 
VALUES 
(N'212503530', N'Bùi', N'Văn', N'Vấn', '2003-02-15', 2021, N'Nam', N'7580206QT'),
(N'222601090', N'Trịnh', N'Đức', N'Quang', '2004-12-01', 2022, N'Nam', N'7480201QT'),
(N'212534103', N'Trần', N'Đức', N'Lương', '2003-11-20', 2021, N'Nam', N'7520103QT'),
(N'212534028', N'Phạm', N'Hoàng', N'Mai', '2003-08-05', 2021, N'Nữ', N'7340301QT'),
(N'232731150', N'Nguyễn', N'Lan', N'Anh', '2005-12-04', 2023, N'Nữ', N'7340101QT'),
(N'212531062', N'Nguyễn', N'Văn', N'An', '2003-04-16', 2021, N'Nam', N'7580201QT'),
(N'222631063', N'Hà', N'Việt', N'Hoàng', '2004-5-06', 2022, N'Nam', N'7480205'),
(N'212531073', N'Lê', N'Trường', N'Huy', '2003-10-25', 2021, N'Nam', N'7580204QT'),
(N'212531158', N'Nguyễn', N'Quốc', N'Việt', '2003-03-08', 2021, N'Nam', N'7340302'),
(N'232731147', N'Trần', N'Đình', N'Long', '2005-09-06', 2023, N'Nam', N'7340102QT'),
(N'231220751', N'Đỗ', N'Duy', N'Minh', '2005-03-17', 2021, N'Nam', N'7340302'),
(N'232731142', N'Trần', N'Văn', N'Tú', '2005-09-23', 2023, N'Nam', N'7480205');

INSERT INTO Giang_vien (Ma_giang_vien, Ho_va_ten, Ngay_thang_nam_sinh, Hoc_vi, Thoi_gian_bat_dau_cong_tac) 
VALUES 
(N'GV002', N'Phạm Huy Khang', '1965-09-02', N'Tiến sĩ', '1990'),
(N'GV235', N'Hoàng Văn Thông', '1979-07-18', N'Tiến sĩ', '2004'),
(N'GV369', N'Vũ Tuấn Đạt', '1975-11-11', N'Tiến sĩ', '2000'),
(N'GV159', N'Lê Thị Hà', '1978-09-12', N'Thạc sĩ', '2003'),
(N'GV689', N'Nguyễn Hồng Thái', '1966-12-11', N'Tiến sĩ', '1990'),
(N'GV008', N'Nguyễn Sỹ Vũ', '1970-10-15', N'Tiến sĩ', '1998'),
(N'GV158', N'Nguyễn Đông Thiện', '1996-02-14', N'Thạc sĩ', '2022'),
(N'GV248', N'Nguyễn An Thạch', '1975-08-03', N'Tiến sĩ', '2008'),
(N'GV147', N'Nguyễn Mai Thanh', '1980-12-09', N'Tiến sĩ', '2014'),
(N'GV112', N'Bùi Xuân Sơn', '1968-04-01', N'Tiến sĩ', '2000');

INSERT INTO Hoc_phan (Ma_hoc_phan, Ten_hoc_phan, So_tin_chi, Loai, Ty_le_diem_qua_trinh,Ty_le_diem_qua_thi) 
VALUES 
(N'BS05012', N'Vẽ kĩ thuật F1', 2, N'Bắt buộc', 4,6),
(N'IT11093', N'Cấu trúc dữ liệu và giải thuật', 3, N'Bắt buộc', 5,5),
(N'ME04013', N'Chi tiết máy', 3, N'Bắt buộc', 4,6),
(N'TE10223', N'Khoa học quản lý', 3, N'Tự chọn', 4,6),
(N'PS00013', N'Lập kế hoạch kinh doanh', 2, N'Bắt buộc', 5,5),
(N'BS03012', N'Cơ học cơ sở', 2, N'Bắt buộc', 4,6),
(N'IT11053', N'Toán rời rạc', 3, N'Bắt buộc', 4,6),
(N'CA02013', N'Vật liệu xây dựng', 3, N'Bắt buộc', 5,5),
(N'TE00051', N'Marketing căn bản', 2, N'Bắt buộc', 4,6),
(N'BS00032', N'Giải tích', 2, N'Bắt buộc', 4,6);

INSERT INTO Lop_hoc_phan (Nam_hoc, Dot_hoc, Ma_lop_hoc_phan, So_luong_sinh_vien, Ten_lop_hoc_phan, Ma_hoc_phan, Ma_giang_vien) 
VALUES 
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT34', 45, N'Vẽ kĩ thuật F1', N'BS05012', N'GV002'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT08', 50, N'Cấu trúc dữ liệu và giải thuật', N'IT11093', N'GV235'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT10', 40, N'Chi tiết máy', N'ME04013', N'GV369'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT15', 15, N'Khoa học quản lý', N'TE10223', N'GV158'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT02', 35, N'Lập kế hoạch kinh doanh', N'PS00013', N'GV689'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT16', 45, N'Cơ học cơ sở', N'BS03012', N'GV008'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT28', 50, N'Toán rời rạc', N'IT11053', N'GV159'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT22', 40, N'Vật liệu xây dựng', N'CA02013', N'GV248'),
('2022-2023', N'2022_2023_1 Đợt học 1', N'QT19', 40, N'Marketing căn bản', N'TE00051', N'GV147'),
('2023-2024', N'2023_2024_1 Đợt học 1', N'QT05', 35, N'Giải tích', N'BS00032', N'GV112');

INSERT INTO Bao_gom (Thuoc_hoc_ky, Ma_hoc_phan, Ma_chuong_trinh_dao_tao) 
VALUES 
(N'Học kỳ 3', N'BS05012', N'7580206QT'),
(N'Học kỳ 3', N'IT11093', N'7480201QT'),
(N'Học kỳ 3', N'ME04013', N'7520103QT'),
(N'Học kỳ 4', N'TE10223', N'7340301QT'),
(N'Học kỳ 1', N'PS00013', N'7340101QT'),
(N'Học kỳ 3', N'BS03012', N'7580201QT'),
(N'Học kỳ 3', N'IT11053', N'7480205'),
(N'Học kỳ 3', N'CA02013', N'7580204QT'),
(N'Học kỳ 4', N'TE00051', N'7340302'),
(N'Học kỳ 1', N'BS00032', N'7340102QT');

INSERT INTO Hoc (Diem_qua_trinh, Diem_thi, Ma_lop_hoc_phan, Ma_sinh_vien) 
VALUES 
(7.5, 8.0, N'QT34', N'212503530'),
(9.0, 9.5, N'QT08', N'222601090'),
(3.0, 3.5, N'QT10', N'212534103'),
(9.0, 9.0, N'QT15', N'212534028'),
(8.5, 9.0, N'QT02', N'232731150'),
(1.0, 0.5, N'QT16', N'212531062'),
(7.0, 7.5, N'QT28', N'222631063'),
(3.0, 4.0, N'QT22', N'212531073'),
(8.5, 9.0, N'QT19', N'212531158'),
(8.0, 7.5, N'QT05', N'232731147');
USE QUANLYSINHVIEN;
-- 1 Sinh viên nhập học năm 2022
SELECT * 
FROM Sinh_vien
WHERE Nam_nhap_hoc = 2022;
-- 2 Học phần có số tín chỉ >= 3
SELECT * 
FROM Hoc_phan
WHERE So_tin_chi >= 3;
--3 Cho biết danh sách các học phần mà sinh viên Trần đình longđăng ký học kỳ 1?
SELECT DISTINCT hp.*  
FROM Hoc_phan hp  
JOIN Bao_gom bg ON hp.Ma_hoc_phan = bg.Ma_hoc_phan  
JOIN Chuong_trinh_dao_tao ctdt ON bg.Ma_chuong_trinh_dao_tao = ctdt.Ma_chuong_trinh_dao_tao  
JOIN Lop_hoc_phan lhp ON hp.Ma_hoc_phan = lhp.Ma_hoc_phan  
JOIN Hoc h ON lhp.Ma_lop_hoc_phan = h.Ma_lop_hoc_phan  
JOIN Sinh_vien sv ON h.Ma_sinh_vien = sv.Ma_sinh_vien  
WHERE bg.Thuoc_hoc_ky = N'Học kỳ 1'  
AND sv.Ho = N'Trần' AND sv.Dem = N'Đình' AND sv.Ten = N'Long';
--4 Hãy cho biết tổng số tín chỉ mà sinh viên Lê Trường huy đã đăng ký trong học kì 3?
SELECT SUM(hp.So_tin_chi) AS Tong_so_tin_chi
FROM Sinh_vien SV
JOIN Hoc H ON SV.Ma_sinh_vien = H.Ma_sinh_vien
JOIN Lop_hoc_phan LHP ON H.Ma_lop_hoc_phan = LHP.Ma_lop_hoc_phan
JOIN Hoc_phan HP ON LHP.Ma_hoc_phan = HP.Ma_hoc_phan
JOIN Bao_gom ON HP.Ma_hoc_phan = Bao_gom.Ma_hoc_phan
WHERE SV.Ho = N'Lê' AND SV.Dem = N'Trường' AND SV.Ten = N'Huy' AND Bao_gom.Thuoc_hoc_ky = N'Học kỳ 3'
GROUP BY SV.Ma_sinh_vien;
--5 Tìm tên của sinh viên có điểm tổng kết của lớp học phần QT19 lớn hơn 8
SELECT sv.Ho, sv.Dem, sv.Ten
FROM Sinh_vien sv
JOIN Hoc h ON sv.Ma_sinh_vien = h.Ma_sinh_vien
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Bao_gom bg ON lhp.Ma_hoc_phan = bg.Ma_hoc_phan
WHERE lhp.Ma_lop_hoc_phan = 'QT19'
AND h.Diem_thi > 8;
--6 Thống kê số lượng sinh viên theo chương trình đào tạo (năm nhập học từ 2020 trở đi)
SELECT CTDT.Ma_chuong_trinh_dao_tao, CTDT.Ten_chuong_trinh_dao_tao, COUNT(sv.Ma_sinh_vien) AS So_luong_sinh_vien
FROM SINH_VIEN SV
JOIN CHUONG_TRINH_DAO_TAO CTDT ON SV.Ma_chuong_trinh_dao_tao = CTDT.Ma_chuong_trinh_dao_tao
GROUP BY CTDT.Ma_chuong_trinh_dao_tao, CTDT.Ten_chuong_trinh_dao_tao;
--7 thống kê số lượng học phần mà mỗi giảng viên phải dạy theo từng năm
SELECT GV.Ma_giang_vien, GV.Ho_va_ten, LHP.Nam_hoc, COUNT(DISTINCT LHP.Ma_hoc_phan) AS So_luong_hoc_phan
 FROM GIANG_VIEN GV 
JOIN LOP_HOC_PHAN LHP ON GV.Ma_giang_vien = LHP.Ma_giang_vien
 GROUP BY GV.Ma_giang_vien, GV.Ho_va_ten, LHP.Nam_hoc
 ORDER BY LHP.Nam_hoc, So_luong_hoc_phan DESC;
 --8 Thống kê số năm học có số hs đk từ 5 học sinh trở đi

SELECT 
    lhp.Nam_hoc, 
    COUNT(sv.Ma_sinh_vien) AS So_luong_sinh_vien
FROM Sinh_Vien sv
join Hoc h on h.Ma_sinh_vien= sv.Ma_sinh_vien
join Lop_hoc_phan lhp on lhp.Ma_lop_hoc_phan=h.Ma_lop_hoc_phan
GROUP BY Nam_hoc
HAVING COUNT(sv.Ma_sinh_vien) >= 5
--9 Thống kê số lượng sinh viên được 8 điểm trở lên  theo từng học phần,chỉ lấy các học phần có từ 1 học sinh trở lên
SELECT 
    Ma_hoc_phan, 
    COUNT(sv.Ma_sinh_vien) AS So_luong_sinh_vien
FROM Lop_hoc_phan lhp
join Hoc h on h.Ma_lop_hoc_phan=lhp.Ma_lop_hoc_phan
join Sinh_vien sv on sv.Ma_sinh_vien=h.Ma_sinh_vien
WHERE h.Diem_qua_trinh IS NOT NULL
GROUP BY Ma_hoc_phan
HAVING AVG(h.Diem_qua_trinh) >= 8 AND COUNT(sv.Ma_sinh_vien) >= 1

--10 thống kê điểm thi của lớp học phần có tên 'Vẽ kĩ thuật F1' có điểm từ 5 trở lên theo chiều giảm dần
SELECT 
    lhp.Ten_lop_hoc_phan,
    AVG(h.Diem_thi) AS DiemTB
FROM Hoc h
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE hp.Ten_hoc_phan = N'Vẽ kĩ thuật F1'
GROUP BY lhp.Ten_lop_hoc_phan
HAVING AVG(h.Diem_thi) >= 5
ORDER BY DiemTB DESC;
-- 11 Thống kê số sinh viên theo từng chương trình đào tạo nhập học năm 2022 có từ 2 sinh viên trở lên
SELECT 
    ctdt.Ten_chuong_trinh_dao_tao,
    COUNT(sv.Ma_sinh_vien) AS So_luong_sinh_vien
FROM Sinh_vien sv
JOIN Chuong_trinh_dao_tao ctdt ON sv.Ma_chuong_trinh_dao_tao = ctdt.Ma_chuong_trinh_dao_tao
WHERE sv.Nam_nhap_hoc >= 2021
GROUP BY ctdt.Ten_chuong_trinh_dao_tao
HAVING COUNT(sv.Ma_sinh_vien) >= 2
ORDER BY So_luong_sinh_vien DESC;
--12  Thống kê điểm trung bình của sinh viên có điểm lớn hơn điểm trung bình toàn trường
SELECT 
    sv.Ma_sinh_vien,
    sv.Ho, sv.Dem, sv.Ten,
    AVG(h.Diem_thi) AS DiemTB
FROM Hoc h
JOIN Sinh_vien sv ON h.Ma_sinh_vien = sv.Ma_sinh_vien
WHERE h.Diem_thi IS NOT NULL
GROUP BY sv.Ma_sinh_vien, sv.Ho, sv.Dem, sv.Ten
HAVING AVG(h.Diem_thi) > (
    SELECT AVG(Diem_thi) FROM Hoc WHERE Diem_thi IS NOT NULL
)
ORDER BY DiemTB DESC;
--13 Thống kê điểm trung bình từng học phần có điểm trung bình cao hơn học phần “Toán rời rạc”
SELECT 
    hp.Ten_hoc_phan,
    AVG(h.Diem_thi) AS Diem_TB
FROM Hoc h
JOIN Lop_hoc_phan lhp ON h.Ma_lop_hoc_phan = lhp.Ma_lop_hoc_phan
JOIN Hoc_phan hp ON lhp.Ma_hoc_phan = hp.Ma_hoc_phan
WHERE h.Diem_thi IS NOT NULL
GROUP BY hp.Ten_hoc_phan
HAVING AVG(h.Diem_thi) > (
    SELECT AVG(h2.Diem_thi)
    FROM Hoc h2
    JOIN Lop_hoc_phan lhp2 ON h2.Ma_lop_hoc_phan = lhp2.Ma_lop_hoc_phan
    JOIN Hoc_phan hp2 ON lhp2.Ma_hoc_phan = hp2.Ma_hoc_phan
    WHERE hp2.Ten_hoc_phan = N'Toán rời rạc')
ORDER BY Diem_TB DESC;
--14 Chèn sinh viên mới nếu chưa tồn tại
INSERT INTO Sinh_vien (Ma_sinh_vien, Ho, Dem, Ten, Gioi_tinh, Nam_nhap_hoc, Ma_chuong_trinh_dao_tao)
SELECT '999999999', N'Nguyễn', N'Văn', N'Giang', N'Nam', 2024, '7340101QT'
WHERE NOT EXISTS (
    SELECT 1 FROM Sinh_vien WHERE Ma_sinh_vien = 'SV999'
);
--15 Ghi điểm cho sinh viên vừa mới thêm
INSERT INTO Hoc (Ma_lop_hoc_phan, Ma_sinh_vien, Diem_qua_trinh, Diem_thi)
SELECT N'QT34', '999999999', 7.5, 8.0
WHERE EXISTS (
    SELECT 1 FROM Lop_hoc_phan WHERE Ma_lop_hoc_phan =  N'QT34'
);
-- 16Cập nhật ngày sinh cho sv vừa thêm:
UPDATE Sinh_vien
SET Ngay_sinh=2005-11-04
WHERE Ten = N'Giang' AND  Ngay_sinh IS NULL;
-- 17 tăng 1 điểm thi cho các sinh viên có điểm thi dưới 5
UPDATE Hoc
SET Diem_thi = Diem_thi + 1
WHERE Diem_thi < 5 AND Diem_thi IS NOT NULL
--18 Xóa điểm của sinh  viên vừa mới thêm vào
DELETE FROM Hoc
WHERE Ma_sinh_vien = '999999999';
--19 Xóa sinh viên vừa mới thêm vào;
DELETE FROM Sinh_vien
WHERE Ma_sinh_vien = '999999999';
--20 Thống kê số lượng sinh viên đăng kí từng học phần theo chương trình đào tạo
SELECT 
    CTDT.Ma_chuong_trinh_dao_tao, 
    CTDT.Ten_chuong_trinh_dao_tao, 
    HP.Ma_hoc_phan, 
    HP.Ten_hoc_phan, 
    COUNT(DISTINCT SV.Ma_sinh_vien) AS So_luong_sinh_vien
FROM SINH_VIEN SV
join Hoc h on h.Ma_sinh_vien=sv.Ma_sinh_vien
JOIN LOP_HOC_PHAN LHP 
    ON h.Ma_lop_hoc_phan=lhp.Ma_lop_hoc_phan
JOIN HOC_PHAN HP 
    ON LHP.Ma_hoc_phan = HP.Ma_hoc_phan
JOIN CHUONG_TRINH_DAO_TAO CTDT 
    ON SV.Ma_chuong_trinh_dao_tao = CTDT.Ma_chuong_trinh_dao_tao
GROUP BY 
    CTDT.Ma_chuong_trinh_dao_tao, 
    CTDT.Ten_chuong_trinh_dao_tao, 
    HP.Ma_hoc_phan, 
    HP.Ten_hoc_phan
HAVING COUNT(DISTINCT SV.Ma_sinh_vien) > 0
ORDER BY So_luong_sinh_vien DESC;












