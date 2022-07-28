--create database Movies
--drop database Movies
/*
drop table Promotion 
drop table Booked_seat
drop table Booking
drop table Schedule
drop table Movie_category

drop table Users
drop table Actor_movie
drop table Movie
drop table Screen
drop table Screen_detail

drop table Cinema_Food
drop table Cinema_Price
drop table Cinema
drop table Price
drop table Category
drop table Extra_price
drop table Actor
drop table Food
*/

use Movies

create table Actor (
	actor_id int identity(1, 1) primary key,
	actor_name nvarchar(50) not null,
	sex bit not null,
	birthday date not null,
	describe nvarchar(500) not null,
	role bit not null,
);

create table Users (
	user_id int identity(1, 1) primary key,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	password nvarchar(100) not null,
	phone nvarchar(12) not null,
	birthday date not null,
	mail nvarchar(50) not null,
	role varchar(50) not null
);

create table Category (
	category_id int identity(1,1) primary key,
	name nvarchar(20) not null
);

create table Food (
	food_id int identity(1, 1) primary key,
	food_name nvarchar(50) not null,
	describe nvarchar(100) not null,
	price int not null
);

create table Extra_price (
	extra_price_id int identity(1,1) primary key,
	address nvarchar(20) not null,
	couple int not null,
	blockbuster int not null,
	three_dimesions int not null
);

create table Promotion (
	promotion_id int identity(1, 1) primary key,
	describe nvarchar(50) not null,
	img varchar(100) not null,
	status bit not null
);

create table Price (
	price_id int identity(1, 1),
	customer_type nvarchar(20) not null,
	monday int not null,
	tues_wed_thu_before11h int not null,
	tues_wed_thu_before17h int not null,
	tues_wed_thu_after17h int not null,
	tues_wed_thu_after22h int not null,
	fri_sat_sun_before22h int not null,
	fri_sat_sun_after22h int not null,
	primary key (price_id),
);

create table Cinema (
	cinema_id int identity(1, 1) primary key,
	cinema_name nvarchar(20) not null,
	cinema_address nvarchar(100) not null,
	phone nvarchar(12) not null,
	mail nvarchar(30) not null,
	extra_price_id int not null,
	foreign key (extra_price_id) references Extra_price(extra_price_id) on update cascade
																		on delete cascade,
);

create table Cinema_Price (
	cinema_id int,
	price_id int,
	primary key (cinema_id, price_id),
	foreign key (cinema_id) references Cinema(cinema_id) on update cascade
														on delete cascade,
	foreign key (price_id) references Price(price_id) on update cascade
														on delete cascade
);

create table Cinema_Food (
	cinema_id int,
	food_id int,
	primary key (cinema_id, food_id),
	foreign key (cinema_id) references Cinema(cinema_id) on update cascade
														on delete cascade,
	foreign key (food_id) references Food(food_id) on update cascade
													on delete cascade
);

create table Screen_detail (
	screen_detail_id int identity(1, 1) primary key,
	number_of_rows int not null,
	number_of_seats int not null,
	detail nvarchar(50) not null
);

create table Movie (
	movie_id int identity(1,1) primary key,
	name nvarchar(100) not null,
	describe nvarchar(1000) not null,
	img varchar(200) not null,
	length_time int not null,
	movie_type nvarchar(100) not null,
	trailer varchar(100) not null,
	showing_from_date date not null,
	showing_to_date date not null
);

create table Movie_category (
	movie_id int,
	category_id int
	foreign key(movie_id) references Movie(movie_id) on update cascade
													on delete cascade,
	foreign key(category_id) references Category(category_id) on update cascade
															on delete cascade
);

create table Actor_Movie (
	actor_id int not null,
	movie_id int not null
	foreign key(actor_id) references Actor(actor_id) on update cascade
													on delete cascade,
	foreign key(movie_id) references Movie(movie_id) on update cascade
													on delete cascade
);

create table Screen (
	screen_id int identity(1,1),
	cinema_id int not null,
	screen_number int not null,
	screen_type nvarchar(10) not null,
	screen_detail_id int not null,
	primary key (screen_id),
	foreign key (screen_detail_id) references Screen_detail(screen_detail_id) on update cascade
																			on delete cascade,
	foreign key (cinema_id) references Cinema(cinema_id) on update cascade
															on delete cascade
);

create table Schedule (
	schedule_id int identity(1, 1),
	screen_id int not null,
	movie_id int not null,
	showing_date date not null,
	start_time varchar(10) not null,
	primary key (schedule_id),
	foreign key (screen_id) references Screen(screen_id) on update cascade
														on delete cascade,
	foreign key (movie_id) references Movie(movie_id) on update cascade
														on delete cascade
);


create table Booking (
	booking_id int identity(1, 1) primary key,
	user_id int not null,
	schedule_id int not null,
	made_time varchar(50) not null,
	foreign key (user_id) references Users(user_id) on update cascade
																on delete cascade,
	foreign key (schedule_id) references Schedule(schedule_id) on update cascade
																on delete cascade
);

--drop table Food_purchased

--drop table Booking_details
create table Booking_details (
	booking_detail_id int identity(1, 1) primary key,
	booking_id int not null,
	seat_number varchar(10) not null,
	price int not null,
	foreign key (booking_id) references Booking(booking_id) on update cascade
																on delete cascade
);

--drop table Booking_food
create table Booking_food (
	booking_food_id int identity(1, 1) primary key,
	booking_id int not null,
	food_id int null,
	quantity int null,
	price int not null,
	foreign key (food_id) references Food(food_id) on update cascade
																on delete cascade
);

create table Cinema_img (
	cinema_id int primary key,
	img varchar(50)
	foreign key (cinema_id) references Cinema(cinema_id) on update cascade
																on delete cascade
);

create table City (
	district nvarchar(50),
	city nvarchar(20),
	primary key(district, city)
);

--Nhập Actor
--select * from Actor
insert into Actor(actor_name, sex, birthday, describe, role)
values 
('Gal Gadot', 0, '04-30-1985', 'Gal Gadot-Varsano is an Israeli actress and model.', 0),
('Stephanie Beatriz', 0, '02-10-1981', 'Stephanie Beatriz Bischoff Alvizuri is an Argentine-American actress.', 0),
('María Cecilia Botero', 0, '05-13-1955', 'María Cecilia Botero was born on May 13, 1955 in Medellín, Colombia as María Cecilia Botero Cadavid.', 0),
('Robert Pattinson', 1, '05-13-1986', 'Starring in both big-budget and independent films, Pattinson has been ranked among the worlds highest-paid actors.', 0),
('Zoe Kravitz', 0, '12-01-1988', 'Zoë Isabella Kravitz is an American actress, singer, and model.', 0),
('Mark Wahlberg', 1, '06-05-1971', 'Mark Robert Michael Wahlberg, former stage name Marky Mark, is an American actor, producer, businessman and former rapper.', 0),
('Tom Holland', 1, '06-01-1996', 'Thomas Stanley Holland is an English actor. He is recipient of several accolades, including the 2017 BAFTA Rising Star Award.', 0),
('Antonio Banderas', 1, '08-10-1960', 'José Antonio Domínguez Bandera, known professionally as Antonio Banderas, is a Spanish actor, director, producer, and singer.', 0)
;

--Nhập Movie
insert into Movie(name, describe, img, length_time, movie_type, trailer, showing_from_date, showing_to_date) values 
('HOUSE OF GUCCI', N'Bộ phim lấy cảm hứng từ đế chế gia đình đứng sau nhà mốt Gucci của Ý, khi 1 nàng dâu mới gia nhập đã làm rối loạn di sản của gia tộc và gây ra 1 vòng xoáy của sự phản bội, suy đồi , trả thù và...án mạng',
'img/movies/HouseOfGucci.jpg', 158, N'C16 - PHIM DÀNH CHO KHÁN GIẢ TỪ 16 TUỔI TRỞ LÊN', 'https://youtu.be/pGi3Bgn7U5U', '2022-02-18', '2022-03-31'),
('1990', N'Khi ngưỡng tuổi “30 chênh vênh” ập đến với Diễm My,Ninh Dương Lan Ngọc và Nhã Phương vào cùng một thời điểm, hàng loạt những vấn đề về hôn nhân, tình yêu, sự nghiệp,... lần lượt xuất hiện, buộc họ phải giúp đỡ nhau vượt qua cột mốc đầy sóng gió này.',
'img/movies/1990.jpg', 96, N'C13 - PHIM DÀNH CHO KHÁN GIẢ TỪ 13 TUỔI TRỞ LÊN', 'https://youtu.be/KfZdaUu5Rj4', '2022-02-15', '2022-03-25'),
('DEATH ON NILE', N'Chuyến tham quan Ai Cập trên chiếc tàu hơi nước tráng lệ của vị thám tử người Bỉ Hercule bỗng chốc trở thành 1 cuộc điều tra án mạng kinh hoàng khi tuần trăng mật của 1 cặp đôi hoàn hảo bị gián đoạn 1 cách thảm khốc...', 
'img/movies/DeathOnNile.png', 127, N'C16 - PHIM DÀNH CHO KHÁN GIẢ TỪ 16 TUỔI TRỞ LÊN', 'https://youtu.be/5rJUw1xOIC0', '2022-02-11', '2022-04-01'),
('ENCANTO', N'Câu chuyện về 1 gia đình người Madrigals sống ẩn mình trong 1 thị trấn kỳ diệu Encanto. Phép màu Encanto ban cho mọi đứa trẻ siêu sức mạnh, trừ Mirabel....', 
'img/movies/Encanto.jpg', 109, N'P - PHIM PHỔ BIẾN CHO MỌI LỨA TUỔI', 'https://youtu.be/CaimKeDcudo', '2022-01-06', '2022-03-27'),
('THE BATMAN', N'Phim sẽ là những màn hành động của Robert Pattinson khi anh vừa thủ vai 1 thám tử kỳ tài của thành phố Gotham, và đồng thời vẫn là 1 tỷ phú ẩn dật Bruce Wanye', 
'img/movies/TheBatman.jpg', 177, N'C16 - PHIM DÀNH CHO KHÁN GIẢ TỪ 16 TUỔI TRỞ LÊN', 'https://youtu.be/CToSl4w-HGI', '2022-03-04', '2022-04-04'),
('SPIDER-MAN: NO WAY HOME', N'"Spider-Man: No Way Home" sẽ tiếp nối sự kiện hấp dẫn ở phần phim trước khi danh tính của Peter Parker đã bị Mysterio (Jake Gyllenhaal) hé lộ cho cả thế giới',
'img/movies/Spiderman-NoWayHome.jpg', 149, N'C13 - PHIM DÀNH CHO KHÁN GIẢ TỪ 13 TUỔI TRỞ LÊN','https://youtu.be/JfVOs4VSpmA', '2021-12-17', '2021-12-17');

--Nhập Category
insert into Category(name)
values('Horror'), ('Drama'), ('Action'), ('Comedy'), ('Science Fiction'), ('Thriller'), ('Crime'), ('Western'), ('Romance'), ('Adventure'), ('Historical'), ('Document'), ('Animation'), ('Musical')

--Nhập Price
insert into Price(customer_type, monday, tues_wed_thu_before11h, tues_wed_thu_before17h, tues_wed_thu_after17h, tues_wed_thu_after22h, fri_sat_sun_before22h, fri_sat_sun_after22h)
values('adult', 60, 45, 65, 80, 50, 90, 50),
('children', 45, 45, 45, 45, 45, 45, 45),
('adult', 60, 65, 65, 80, 60, 90, 60),
('children', 50, 50, 50, 50, 50, 50, 50),
('adult', 55, 50, 60, 65, 50, 85, 55),
('children', 50, 50, 50, 50, 50, 55	, 50);

--Nhập Extra-Price
insert into Extra_price(address, couple, blockbuster, three_dimesions)
values('VN', 10, 5, 20);

--Nhập Food
insert into Food(food_name, describe, price)
values('Combo Special 1 Khoai Lac - Caramel', 'Combo Special 1 Khoai Lac - Caramel', 144),
('Combo Special 1 Khoai Lac - Cheese', 'Combo Special 1 Khoai Lac - Cheese', 144),
('Combo Special 1 Khoai Lac - Sweet', 'Combo Special 1 Khoai Lac - Sweet', 139),
('Combo Special 2 Khoai Lac - Caramel', 'Combo Special 2 Khoai Lac - Caramel', 174),
('Combo Special 2 Khoai Lac - Cheese', 'Combo Special 2 Khoai Lac - Cheese', 174),
('Combo Special 2 Khoai Lac - Sweet', 'Combo Special 2 Khoai Lac - Sweet', 169),
('Special Combo 2 Bap nam Ga Lac (Caramel)', 'Special Combo 2 Bap nam Ga Lac (Caramel)', 174),
('Special Combo 2 Bap nam Ga Lac (Cheese)', 'Special Combo 2 Bap nam Ga Lac (Cheese)', 174),
('Special Combo 2 Bap nam Ga Lac (Sweet)', 'Special Combo 2 Bap nam Ga Lac (Sweet)', 169);

insert into Cinema(cinema_name, cinema_address, phone, mail, extra_price_id) values
--(N'BHD STAR PHẠM NGỌC THẠCH', N'Tầng 8, Vincom Center Phạm Ngọc Thạch, 02 Phạm Ngọc Thạch, P.Trung Tự, Quận Đống Đa, Hà Nội', '02436373355', 'cskh@bhdstar.vn', 1),
(N'BHD STAR LÊ VĂN VIỆT', N'Tầng 4, Vincom Plaza Lê Văn Việt, 50 Lê Văn Việt, P.Hiệp Phú, Quận 9, TP.HCM', '02837367070', 'cskh@bhdstar.vn', 1),
(N'BHD STAR THẢO ĐIỀN', N'Tầng 5, Vincom Mega Mall Thảo Điền, 159 Xa Lộ Hà Nội, P.Thảo Điền, Quận 2, TP.HCM', '02837446969', 'cskh@bhdstar.vn', 1),
(N'BHD STAR QUANG TRUNG', N'Tầng B1 & B2, Vincom Plaza Quang Trung, 190 Quang Trung, P.10, Quận Gò Vấp, TP.HCM', '02839892468', 'cskh@bhdstar.vn', 1),
(N'BHD STAR PHẠM HÙNG', N'Tầng 4, TTTM Satra Phạm Hùng, C6/27 Phạm Hùng, Quận Bình Chánh, TP.HCM', '02346250238', 'cskh@bhdstar.vn', 1),

(N'BHD STAR LONG KHÁNH', N'430 Hồ Thị Hương, Phường Xuân An, Thành Phố Long Khánh, Đồng Nai', '02512860696', 'cskh@bhdstar.vn', 1),
(N'BHD STAR THE GARDEN', N'Tầng 4, TTTM Garden Shopping Center, Phố Mễ Trì, P.Mỹ Đình 1, Quận Nam Từ Liêm, Hà Nội', '02432068678','cskh@bhdstar.vn', 1),
(N'BHD STAR DISCOVERY', N'Tầng 8, TTTM Discovery – 302 Cầu Giấy, P.Dịch Vọng, Quận Cầu Giấy, Hà Nội', '02432060202', 'cskh@bhdstar.vn', 1),
(N'BHD STAR HUẾ', N'Tầng 5, Vincom Plaza Huế, 50A Hùng Vương tổ 10, Phú Nhuận, Thành phố Huế, Thừa Thiên Huế', '02346250238', 'cskh@bhdstar.vn', 1)
;

insert into Screen_detail(number_of_rows, number_of_seats, detail) values 
(10, 15, ''),
(12, 20, ''),
(8, 10, '')
;

insert into Screen(cinema_id, screen_number, screen_type, screen_detail_id) values 
(1, 1, '2D', 3),
(1, 2, '2D', 3),
(1, 3, '2D', 3),
(1, 4, '2D', 3),
(2, 1, '2D', 1),
(2, 2, '2D', 1),
(2, 3, '2D', 2),
(2, 4, '2D', 2),
(2, 5, '3D', 1),
(3, 1, '2D', 1),
(3, 2, '2D', 1),
(3, 3, '2D', 1),
(3, 4, '2D', 1),
(4, 1, '2D', 3),
(4, 2, '2D', 3),
(4, 3, '2D', 3),
(4, 4, '2D', 3)
;

insert into Schedule(movie_id, screen_id, showing_date, start_time) values
(1, 1, '03-21-2022', '08:20'),
(1, 1, '03-21-2022', '10:10'),
(1, 1, '03-21-2022', '12:50'),
(1, 1, '03-21-2022', '14:30'),
(1, 1, '03-21-2022', '19:30'),

(1, 5, '03-21-2022', '09:10'),
(1, 5, '03-21-2022', '10:50'),
(1, 5, '03-21-2022', '13:40'),
(1, 5, '03-21-2022', '15:20'),
(1, 5, '03-21-2022', '21:30'),

(1, 10, '03-21-2022', '08:40'),
(1, 10, '03-21-2022', '11:10'),
(1, 10, '03-21-2022', '13:40'),
(1, 10, '03-21-2022', '16:50'),
(1, 10, '03-21-2022', '18:20'),

(1, 14, '03-21-2022', '08:20'),
(1, 14, '03-21-2022', '13:20'),
(1, 14, '03-21-2022', '16:50'),
(1, 14, '03-21-2022', '20:30'),
(1, 14, '03-21-2022', '23:50'),

(2, 2, '03-21-2022', '08:20'),
(2, 2, '03-21-2022', '10:10'),
(2, 2, '03-21-2022', '12:50'),
(2, 2, '03-21-2022', '14:30'),
(2, 2, '03-21-2022', '19:30'),

(2, 11, '03-21-2022', '09:10'),
(2, 11, '03-21-2022', '10:50'),
(2, 11, '03-21-2022', '13:40'),
(2, 11, '03-21-2022', '15:20'),
(2, 11, '03-21-2022', '21:30'),

(2, 6, '03-21-2022', '08:40'),
(2, 6, '03-21-2022', '11:10'),
(2, 6, '03-21-2022', '13:40'),
(2, 6, '03-21-2022', '16:50'),
(2, 6, '03-21-2022', '18:20'),

(2, 15, '03-21-2022', '08:20'),
(2, 15, '03-21-2022', '13:20'),
(2, 15, '03-21-2022', '16:50'),
(2, 15, '03-21-2022', '20:30'),
(2, 15, '03-21-2022', '23:50'),

(3, 3, '03-21-2022', '08:20'),
(3, 3, '03-21-2022', '10:10'),
(3, 3, '03-21-2022', '12:50'),
(3, 3, '03-21-2022', '14:30'),
(3, 3, '03-21-2022', '19:30'),

(3, 12, '03-21-2022', '09:10'),
(3, 12, '03-21-2022', '10:50'),
(3, 12, '03-21-2022', '13:40'),
(3, 12, '03-21-2022', '15:20'),
(3, 12, '03-21-2022', '21:30'),

(3, 7, '03-21-2022', '08:40'),
(3, 7, '03-21-2022', '11:10'),
(3, 7, '03-21-2022', '13:40'),
(3, 7, '03-21-2022', '16:50'),
(3, 7, '03-21-2022', '18:20'),

(3, 16, '03-21-2022', '08:20'),
(3, 16, '03-21-2022', '13:20'),
(3, 16, '03-21-2022', '16:50'),
(3, 16, '03-21-2022', '20:30'),
(3, 16, '03-21-2022', '23:50'),

(4, 4, '03-21-2022', '08:20'),
(4, 4, '03-21-2022', '10:10'),
(4, 4, '03-21-2022', '12:50'),
(4, 4, '03-21-2022', '14:30'),
(4, 4, '03-21-2022', '19:30'),

(4, 8, '03-21-2022', '09:10'),
(4, 8, '03-21-2022', '10:50'),
(4, 8, '03-21-2022', '13:40'),
(4, 8, '03-21-2022', '15:20'),
(4, 8, '03-21-2022', '21:30'),

(4, 13, '03-21-2022', '08:40'),
(4, 13, '03-21-2022', '11:10'),
(4, 13, '03-21-2022', '13:40'),
(4, 13, '03-21-2022', '16:50'),
(4, 13, '03-21-2022', '18:20'),

(4, 17, '03-21-2022', '08:20'),
(4, 17, '03-21-2022', '13:20'),
(4, 17, '03-21-2022', '16:50'),
(4, 17, '03-21-2022', '20:30'),
(4, 17, '03-21-2022', '23:50'),

(1, 1, '03-22-2022', '08:20'),
(1, 1, '03-22-2022', '10:10'),
(1, 1, '03-22-2022', '12:50'),
(1, 1, '03-22-2022', '14:30'),
(1, 1, '03-22-2022', '19:30'),

(1, 5, '03-22-2022', '09:10'),
(1, 5, '03-22-2022', '10:50'),
(1, 5, '03-22-2022', '13:40'),
(1, 5, '03-22-2022', '15:20'),
(1, 5, '03-22-2022', '21:30'),

(1, 10, '03-22-2022', '08:40'),
(1, 10, '03-22-2022', '11:10'),
(1, 10, '03-22-2022', '13:40'),
(1, 10, '03-22-2022', '16:50'),
(1, 10, '03-22-2022', '18:20'),

(1, 14, '03-22-2022', '08:20'),
(1, 14, '03-22-2022', '13:20'),
(1, 14, '03-22-2022', '16:50'),
(1, 14, '03-22-2022', '20:30'),
(1, 14, '03-22-2022', '23:50'),

(2, 2, '03-22-2022', '08:20'),
(2, 2, '03-22-2022', '10:10'),
(2, 2, '03-22-2022', '12:50'),
(2, 2, '03-22-2022', '14:30'),
(2, 2, '03-22-2022', '19:30'),

(2, 11, '03-22-2022', '09:10'),
(2, 11, '03-22-2022', '10:50'),
(2, 11, '03-22-2022', '13:40'),
(2, 11, '03-22-2022', '15:20'),
(2, 11, '03-22-2022', '21:30'),

(2, 6, '03-22-2022', '08:40'),
(2, 6, '03-22-2022', '11:10'),
(2, 6, '03-22-2022', '13:40'),
(2, 6, '03-22-2022', '16:50'),
(2, 6, '03-22-2022', '18:20'),

(2, 15, '03-22-2022', '08:20'),
(2, 15, '03-22-2022', '13:20'),
(2, 15, '03-22-2022', '16:50'),
(2, 15, '03-22-2022', '20:30'),
(2, 15, '03-22-2022', '23:50'),

(3, 3, '03-22-2022', '08:20'),
(3, 3, '03-22-2022', '10:10'),
(3, 3, '03-22-2022', '12:50'),
(3, 3, '03-22-2022', '14:30'),
(3, 3, '03-22-2022', '19:30'),

(3, 12, '03-22-2022', '09:10'),
(3, 12, '03-22-2022', '10:50'),
(3, 12, '03-22-2022', '13:40'),
(3, 12, '03-22-2022', '15:20'),
(3, 12, '03-22-2022', '21:30'),

(3, 7, '03-22-2022', '08:40'),
(3, 7, '03-22-2022', '11:10'),
(3, 7, '03-22-2022', '13:40'),
(3, 7, '03-22-2022', '16:50'),
(3, 7, '03-22-2022', '18:20'),

(3, 16, '03-22-2022', '08:20'),
(3, 16, '03-22-2022', '13:20'),
(3, 16, '03-22-2022', '16:50'),
(3, 16, '03-22-2022', '20:30'),
(3, 16, '03-22-2022', '23:50'),

(4, 4, '03-22-2022', '08:20'),
(4, 4, '03-22-2022', '10:10'),
(4, 4, '03-22-2022', '12:50'),
(4, 4, '03-22-2022', '14:30'),
(4, 4, '03-22-2022', '19:30'),

(4, 8, '03-22-2022', '09:10'),
(4, 8, '03-22-2022', '10:50'),
(4, 8, '03-22-2022', '13:40'),
(4, 8, '03-22-2022', '15:20'),
(4, 8, '03-22-2022', '21:30'),

(4, 13, '03-22-2022', '08:40'),
(4, 13, '03-22-2022', '11:10'),
(4, 13, '03-22-2022', '13:40'),
(4, 13, '03-22-2022', '16:50'),
(4, 13, '03-22-2022', '18:20'),

(4, 17, '03-22-2022', '08:20'),
(4, 17, '03-22-2022', '13:20'),
(4, 17, '03-22-2022', '16:50'),
(4, 17, '03-22-2022', '20:30'),
(4, 17, '03-22-2022', '23:50'),

(1, 1, '03-23-2022', '08:20'),
(1, 1, '03-23-2022', '10:10'),
(1, 1, '03-23-2022', '12:50'),
(1, 1, '03-23-2022', '14:30'),
(1, 1, '03-23-2022', '19:30'),

(1, 5, '03-23-2022', '09:10'),
(1, 5, '03-23-2022', '10:50'),
(1, 5, '03-23-2022', '13:40'),
(1, 5, '03-23-2022', '15:20'),
(1, 5, '03-23-2022', '21:30'),

(1, 10, '03-23-2022', '08:40'),
(1, 10, '03-23-2022', '11:10'),
(1, 10, '03-23-2022', '13:40'),
(1, 10, '03-23-2022', '16:50'),
(1, 10, '03-23-2022', '18:20'),

(1, 14, '03-23-2022', '08:20'),
(1, 14, '03-23-2022', '13:20'),
(1, 14, '03-23-2022', '16:50'),
(1, 14, '03-23-2022', '20:30'),
(1, 14, '03-23-2022', '23:50'),

(2, 2, '03-23-2022', '08:20'),
(2, 2, '03-23-2022', '10:10'),
(2, 2, '03-23-2022', '12:50'),
(2, 2, '03-23-2022', '14:30'),
(2, 2, '03-23-2022', '19:30'),

(2, 11, '03-23-2022', '09:10'),
(2, 11, '03-23-2022', '10:50'),
(2, 11, '03-23-2022', '13:40'),
(2, 11, '03-23-2022', '15:20'),
(2, 11, '03-23-2022', '21:30'),

(2, 6, '03-23-2022', '08:40'),
(2, 6, '03-23-2022', '11:10'),
(2, 6, '03-23-2022', '13:40'),
(2, 6, '03-23-2022', '16:50'),
(2, 6, '03-23-2022', '18:20'),

(2, 15, '03-23-2022', '08:20'),
(2, 15, '03-23-2022', '13:20'),
(2, 15, '03-23-2022', '16:50'),
(2, 15, '03-23-2022', '20:30'),
(2, 15, '03-23-2022', '23:50'),

(3, 3, '03-23-2022', '08:20'),
(3, 3, '03-23-2022', '10:10'),
(3, 3, '03-23-2022', '12:50'),
(3, 3, '03-23-2022', '14:30'),
(3, 3, '03-23-2022', '19:30'),

(3, 12, '03-23-2022', '09:10'),
(3, 12, '03-23-2022', '10:50'),
(3, 12, '03-23-2022', '13:40'),
(3, 12, '03-23-2022', '15:20'),
(3, 12, '03-23-2022', '21:30'),

(3, 7, '03-23-2022', '08:40'),
(3, 7, '03-23-2022', '11:10'),
(3, 7, '03-23-2022', '13:40'),
(3, 7, '03-23-2022', '16:50'),
(3, 7, '03-23-2022', '18:20'),

(3, 16, '03-23-2022', '08:20'),
(3, 16, '03-23-2022', '13:20'),
(3, 16, '03-23-2022', '16:50'),
(3, 16, '03-23-2022', '20:30'),
(3, 16, '03-23-2022', '23:50'),

(4, 4, '03-23-2022', '08:20'),
(4, 4, '03-23-2022', '10:10'),
(4, 4, '03-23-2022', '12:50'),
(4, 4, '03-23-2022', '14:30'),
(4, 4, '03-23-2022', '19:30'),

(4, 8, '03-23-2022', '09:10'),
(4, 8, '03-23-2022', '10:50'),
(4, 8, '03-23-2022', '13:40'),
(4, 8, '03-23-2022', '15:20'),
(4, 8, '03-23-2022', '21:30'),

(4, 13, '03-23-2022', '08:40'),
(4, 13, '03-23-2022', '11:10'),
(4, 13, '03-23-2022', '13:40'),
(4, 13, '03-23-2022', '16:50'),
(4, 13, '03-23-2022', '18:20'),

(4, 17, '03-23-2022', '08:20'),
(4, 17, '03-23-2022', '13:20'),
(4, 17, '03-23-2022', '16:50'),
(4, 17, '03-23-2022', '20:30'),
(4, 17, '03-23-2022', '23:50'),

(1, 1, '03-15-2022', '08:20'),
(1, 1, '03-15-2022', '10:10'),
(1, 1, '03-15-2022', '12:50'),
(1, 1, '03-15-2022', '14:30'),
(1, 1, '03-15-2022', '19:30'),

(1, 14, '03-15-2022', '09:10'),
(1, 14, '03-15-2022', '10:50'),
(1, 14, '03-15-2022', '13:40'),
(1, 14, '03-15-2022', '15:20'),
(1, 14, '03-15-2022', '21:30'),

(1, 5, '03-15-2022', '08:40'),
(1, 5, '03-15-2022', '11:10'),
(1, 5, '03-15-2022', '13:40'),
(1, 5, '03-15-2022', '16:50'),
(1, 5, '03-15-2022', '18:20'),

(1, 12, '03-15-2022', '08:20'),
(1, 12, '03-15-2022', '13:20'),
(1, 12, '03-15-2022', '16:50'),
(1, 12, '03-15-2022', '20:30'),
(1, 12, '03-15-2022', '23:50'),

(1, 1, '03-16-2022', '08:20'),
(1, 1, '03-16-2022', '10:10'),
(1, 1, '03-16-2022', '12:50'),
(1, 1, '03-16-2022', '14:30'),
(1, 1, '03-16-2022', '19:30'),

(1, 14, '03-16-2022', '09:10'),
(1, 14, '03-16-2022', '10:50'),
(1, 14, '03-16-2022', '13:40'),
(1, 14, '03-16-2022', '15:20'),
(1, 14, '03-16-2022', '21:30'),

(1, 5, '03-16-2022', '08:40'),
(1, 5, '03-16-2022', '11:10'),
(1, 5, '03-16-2022', '13:40'),
(1, 5, '03-16-2022', '16:50'),
(1, 5, '03-16-2022', '18:20'),

(1, 12, '03-16-2022', '08:20'),
(1, 12, '03-16-2022', '13:20'),
(1, 12, '03-16-2022', '16:50'),
(1, 12, '03-16-2022', '20:30'),
(1, 12, '03-16-2022', '23:50');

insert into Users values
('Hieu', 'Nguyen Trung', '123', '0949525268', '2002-01-17', 'hieunguyen123@gmail.com', 'user')

insert into Users(first_name, last_name, password, phone, birthday, mail, role)
values 
('duc', 'nguyen trong', '123', '0947186566', '10-20-2002', 'nguyenduc20115@gmail.com', 'admin'),
('vanha', 'bui', 'Ngothanbi123', '0949812307', '07-15-2002', 'ha123@gmail.com', 'user'),
('mai', 'nguyen ngoc', 'Ngothanbi111', '0337892644', '07-08-2002', 'ha123@gmail.com', 'user')

insert into Movie_category values
(1, 2), (1, 6), (1, 7),
(2, 2), (2, 9),
(3, 6), (3, 7),
(4, 13), (4, 14),
(5, 3), (5, 5),
(6, 3), (6, 5)
;

--insert into Booking 
--output Inserted.booking_id
--values(1, 1070, '2022-10-20');

--select * from Booking

insert into Cinema_img values 
(1, 'img/cinemas/long-khanh-268x364.jpg'),
(2, 'img/cinemas/GARDEN-268x364.jpg'),
(3, 'img/cinemas/Cau-giay-copy-268x364.jpg'),
(4, 'img/cinemas/HUE-copy-268x364.jpg'),
(1006, 'img/cinemas/LVV-268x364.jpg'),
(1007, 'img/cinemas/THAO-DIEN-CINEMA-268x364.jpg'),
(1008, 'img/cinemas/QUANG-TRUNG-268x364.jpg'),
(1009, 'img/cinemas/PH-268x364.jpg');

insert into City values
('Thành Phố Long Khánh', 'Đồng Nai'),
('Quận Nam Từ Liêm', 'Hà Nội'),
('Quận Cầu Giấy', 'Hà Nội'),
('Thành phố Huế', 'Huế'),
('Quận 9', 'TP.HCM'),
('Quận 2', 'TP.HCM'),
('Quận Gò Vấp', 'TP.HCM'),
('Quận Bình Chánh', 'TP.HCM')
