-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Sep 2020 pada 13.06
-- Versi server: 10.1.30-MariaDB
-- Versi PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `disc`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `email`, `password`) VALUES
(1, 'padang@gmail.com', 'abc123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `disc`
--

CREATE TABLE `disc` (
  `id_disc` int(11) NOT NULL,
  `nama_disc` varchar(50) NOT NULL,
  `penjelasan` text NOT NULL,
  `kelebihan` text NOT NULL,
  `kekurangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `disc`
--

INSERT INTO `disc` (`id_disc`, `nama_disc`, `penjelasan`, `kelebihan`, `kekurangan`) VALUES
(1, 'Dominance', 'Dominance. Mereka yang suka mengendalikan lingkungan mereka, serta senang menggerakkan orang-orang di sekitar mereka. Mereka adalah jenis pribadi yang suka to-the-point, tidak bertele-tele. Mereka juga senang mengambil peran penting, pembuat keputusan, problem solver, dan melaksanakan berbagai hal. Mereka cenderung menyukai posisi sebagai leader. Meskipun demikian, ketika menjadi leader, mereka cenderung akan menjadi pemimpin yang otoriter, demanding, dan kurang memiliki kesabaran serta empati pada bawahan.', 'Extrovert, suka hal-hal baru/ menantang, pemberani, berorientasi pada hasil, cepat mengambil keputusan, to the point, proaktif, gigih, independent, senang mengatur.', 'Terlalu bangga pada diri sendiri, tidak sabar, argumentative, tidak menganalisis detail.'),
(2, 'Influence', 'Influence. Mereka yang suka bergaul dengan orang lain, ekstrovert, dan senang berada pada lingkaran pertemanan yang luas. Mereka benar-benar menikmati berada bersama teman-temannya. Mereka tidak suka menyelesaikan sesuatu atau bekerja sendirian (singlefighter). Sebaliknya, mereka lebih suka berhubungan dan bekerja dengan orang-orang daripada sendirian.', 'Percaya diri, ekspresif, mudah bergaul, optimis, demonstrative, persuasive', 'Promosi diri, narsis, terlalu optimis, bawel, tidak realistis'),
(3, 'Steadiness', 'Steadiness. Mereka yang introvert, reserve, dan quiet. Mereka adalah orang-orang yang lebih suka melakukan sesuatu secara sistematis, teratur dan bertahap. Mereka juga cendrung menyukai sesuatu yang berjalan dengan konsisten, dapat diprediksi dan lingkungan kerja yang stabil dan harmonis. Orang-orang dalam model ini juga tergolong pribadi yang sabar, dapat diandalkan dan cenderung memiliki loyalitas yang tinggi.', 'Stabil / tidak meledak-ledak, ramah/ bersahabat, sabar, pendengar yang baik, tulus, stabil dan terprediksi, berpikir logis', 'Apatis, egois/cuek, ragu-ragu, pasif, tidak fleksibel.'),
(4, 'Conscientiousness', 'Conscientiousness. Mereka termasuk pribadi yang menekankan akurasi dan ketelitian. Mereka cenderung menyukai sesuatu yang direncanakan dengan matang dan bersifat menyeluruh. Mereka juga cenderung suka dengan pekerjaan yang mengacu pada prosedur dan standar operasi yang baku. Orang-orang dalam kategori ini adalah pemikir yang kritis dan suka melakukan analisa untuk memastikan akurasi.', 'Akurat, analytical, melakukan sesuatu dengan benar, diplomatis, pencari fakta, sopan, terjadwal.', 'Terlalu khawatir, terlalu berhati-hati, tidak suka bersosialisasi, teoritis, kurang praktis, pesimis, perfeksionis.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `partisipan`
--

CREATE TABLE `partisipan` (
  `id_partisipan` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `alamat_email` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `username_instagram` varchar(50) NOT NULL,
  `id_disc` int(11) NOT NULL,
  `hasil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `partisipan`
--

INSERT INTO `partisipan` (`id_partisipan`, `nama_lengkap`, `alamat_email`, `jenis_kelamin`, `username_instagram`, `id_disc`, `hasil`) VALUES
(25, 'nrhasunazn', 'nrhasunazn@gmail.com', 'P', 'nrhasunazn', 4, '[{\"captionasli\": \"purple gituww\\ud83c\\udf6c\", \"id\": \"2405225928117902409\", \"username\": \"nrhasunazn\", \"captionpraproses\": \"purple gituw\", \"disc\": \"C\"}, {\"captionasli\": \"instagram ruined the quality\\ud83d\\udc3b\\ud83e\\ude90\", \"id\": \"2389949982595025582\", \"username\": \"nrhasunazn\", \"captionpraproses\": \"instagram ruined the quality\", \"disc\": \"C\"}, {\"captionasli\": \"Erkkk\\ud83e\\udddf\\u200d\\u2640\\ufe0f\", \"id\": \"2375462825138563049\", \"username\": \"nrhasunazn\", \"captionpraproses\": \"erk\", \"disc\": \"C\"}]'),
(26, 'testing@gmail.com', 'sadasdasdasdas@gmail.com', 'L', 'kurniaarifin18', 4, '[{\"captionasli\": \"Keinget dulu waktu masih awal - awal di jogja pengin main ke luar jogja \\ud83d\\ude02 dan sekarang belum bisa kumpul lagi, nggak tau tar kalo dah pada kejogja ntar ada yang dah lulus lah, ada yang mau nikah lah, atau mungkin ada yang udah nggak balik ke jogja mungkin karna dah kerja.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\nArsip 2017\", \"id\": \"2400197381749572399\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"keinget dulu waktu awal awal jogja pengin main luar jogja sekarang bisa kumpul lagi tau tar kalo dah kejogja ntar yang dah lulus lah yang mau nikah lah mungkin yang udah balik jogja mungkin karna dah kerja arsip 2017\", \"disc\": \"C\"}, {\"captionasli\": \"terima kasih atas semua nikmat, waktu, dan umur yang masih engkau berikan, maaf selama ini aku sering mengeluh\", \"id\": \"2378310114173064261\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"terima kasih atas semua nikamuat waktu umur masih engkau berikan maf selama aku sering mengeluh\", \"disc\": \"C\"}, {\"captionasli\": \"Banyak memori di tempat ini\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#wonderful_places #wonderfulindonesia #wonderfuldestinations #nusatenggarabarat #lombok #gilitrawanganisland #indonesia\", \"id\": \"2277685389605018374\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"banyak memori tempat ini\", \"disc\": \"I\"}, {\"captionasli\": \"kangen ndaki\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n\\n@aditiyabayunugroho007 \\n@cienkprianto \\n@meilitawatii \\n@pamujifitriana20 \\n@arifsbudi18\", \"id\": \"2269742536027403669\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"kangen ndaki\", \"disc\": \"D\"}, {\"captionasli\": \"Sekian lama tak berjumpa denganmu\", \"id\": \"2239997801658509759\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"sekian lama tak berjumpa denganmu\", \"disc\": \"C\"}, {\"captionasli\": \"fly \\u2708\", \"id\": \"2213170891616107825\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"fly\", \"disc\": \"C\"}, {\"captionasli\": \"gumuk pasir\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#gumukpasir \\n#yogyakarta\", \"id\": \"2205835674375158699\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"gumuk pasir\", \"disc\": \"C\"}, {\"captionasli\": \"Twilight reminds me of tomorrow\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#gumukpasir #jogjakarta #jogjaistimewa #wonderfullindonesia #wonderfuldestinations\", \"id\": \"2182027984683286646\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"twilight reminds me of tomorow\", \"disc\": \"C\"}, {\"captionasli\": \"Maka kamu akan tahu bagaimana ego,semangat,keyakinan,kelemaha,perjuangan, dan kebersamaan.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\ncamera : Redmi note7\\n#javaeducation #wonderfullindonesia #wonderfuldestinations #sumbingmountain #redminote7\", \"id\": \"2128275058613860595\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"maka kamu tahu bagaimana ego semangat keyakinan kelemaha perjuangan kebersaman camera redmi note7\", \"disc\": \"S\"}, {\"captionasli\": \"your steps can\'t stop\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#pinusmangunan #jogja #wonderfulindonesia\", \"id\": \"2115048167706924515\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"your steps cant stop\", \"disc\": \"C\"}, {\"captionasli\": \"trimakasih engkau masih memberiku nafas sampai detik ini \\ud83d\\ude4f\\ud83c\\udffc\", \"id\": \"2112839732818894112\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"trimakasih engkau memberiku nafas detik\", \"disc\": \"C\"}, {\"captionasli\": \"a pleasant moment\\n\\n@alfianpb25 \\n@amad_wauz04 \\n@aditiyabayunugroho007 \\n@mamas_cahyo24 \\n@anton_series16 \\n#curugcipendok\\n#banyumashits\\n#purwokertohitz\\n#wonderfulindonesia\\n#wonderfuldestinations\\n#cilacaphits\", \"id\": \"2082167953188683781\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"a pleasant moment\", \"disc\": \"S\"}, {\"captionasli\": \"someday we will be reunited\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#curugcipendok\\n#purwokerto #wonderfulindonesia #wonderfuldestinations #banyumas\", \"id\": \"1988462441058632480\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"someday we wil be reunited\", \"disc\": \"C\"}, {\"captionasli\": \"Mata ini selalu terbatas memandang mu,\\nDan tak pernah puas memandangmu setiap detik waktu\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#jogjaistimewa #wonderfuldestinations #wonderfulindonesian #indonesia_photography #photography\", \"id\": \"1965255643564671373\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"mata selalu terbatas memandang mu dan tak pernah puas memandangmu detik waktu\", \"disc\": \"C\"}, {\"captionasli\": \"behind a snapshot of the picture there is a hidden meaning inside it\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n\\ud83d\\udcf7by:@m.alvin24\", \"id\": \"1933968004236942614\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"behind a snapshot of the picture there is a hiden meaning inside it by\", \"disc\": \"C\"}, {\"captionasli\": \"Masih semu\", \"id\": \"1896109691089412385\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"masih semu\", \"disc\": \"D\"}, {\"captionasli\": \"18 agustus waktu bertambah dan pengingat berakhir\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#wonderfuldestinations #wonderfulindonesia #instamood #vacationvibes #urbanstyle #urbexpeople #goodvibes #nature #forestphotography #colorgrade\", \"id\": \"1848619496337507172\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"18 agustus waktu bertambah pengingat berakhir\", \"disc\": \"C\"}, {\"captionasli\": \"the best moment with friends\\n.\\n.\\n.\\n.\\n.\\n.\\n#wonderfuldestinations #wonderfulindonesia\\n#instamood #vacationvibes #urbanstyle #urbexpeople #goodvibes #nature ##forestphotography #colorgrade\", \"id\": \"1840721097508369730\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"the best moment with friends\", \"disc\": \"C\"}, {\"captionasli\": \"sometimes someone comes so fast as to forget the time and after that he suddenly leaves without realizing he is gone\\n\\n#wonderfuldestinations #wonderfulindonesia #sunset #indonesia #wonosobozone\", \"id\": \"1836796788205294799\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"sometimes someone comes so fast as to foranget the time and after that he sudenly leaves without realizing he is gone\", \"disc\": \"D\"}, {\"captionasli\": \"Telaga warna\\n.\\n.\\n.\\n.\\n.\\n.\\n#indonesia #wonderfulindonesia #wonderfuldestinations #wonosobo #wonosobozone\", \"id\": \"1834727148079548272\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"telaga warna\", \"disc\": \"S\"}, {\"captionasli\": \"the omnipotent creation\\n.\\n.\\n.\\n.\\n.\\n.\\n#wonderfulindonesia \\n#wonderfuldestinations \\n#wonosobozone\", \"id\": \"1834010867793750887\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"the omnipotent creation\", \"disc\": \"C\"}, {\"captionasli\": \"friend measure the way\\n.\\n.\\n.\\n..\\n#beautifuldestinations \\n#lightroom \\n#light\", \"id\": \"1794776904546314478\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"friend measure the way\", \"disc\": \"C\"}, {\"captionasli\": \"Yogyakarta\\n.\\n.\\n.\\n.\\n.\\n#beautyfuldestinations #yogyakarta #wonderfulindonesia #jogjahits\", \"id\": \"1771986734222770259\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"yogyakarta\", \"disc\": \"S\"}, {\"captionasli\": \"I am single and i am happy.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#beautifuldestinations #moodbooster #moodygram #lensbible\", \"id\": \"1747162182619496013\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"i am single and i am hapy\", \"disc\": \"C\"}, {\"captionasli\": \"Squad Dooland entertainment .\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n.\\n#jogjaexpl #wonderfulindonesia #jogja#jogjakarta #explorindonesia #photography\", \"id\": \"1746315198098361252\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"squad doland entertainment\", \"disc\": \"I\"}, {\"captionasli\": \"Big hope for big dreams \\n#yogyakarta \\n#wonterfulindonesia\\n#explorejogja \\n#jawatengah \\n#cilacaphits\", \"id\": \"1745096511840377657\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"big hope for big dreams\", \"disc\": \"I\"}, {\"captionasli\": \"Tak pernah di lupakan finalis piala dunia menjajal kekuatan indonesia \\n#timnasindonesia #timnasislandia\", \"id\": \"1691396930028269554\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"tak pernah lupakan finalis piala dunia menjajal kekuatan indonesia\", \"disc\": \"D\"}, {\"captionasli\": \"Mbajing rasa kale \\ud83d\\udc4a\\ud83d\\udc4c\", \"id\": \"1635734785074473077\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"mbajing rasa kale\", \"disc\": \"D\"}, {\"captionasli\": \"Tertuang dalam satu kenangan\", \"id\": \"1525497199189105178\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"tertuang satu kenangan\", \"disc\": \"C\"}, {\"captionasli\": \"Pengin trap ling maning\", \"id\": \"1495045016933157351\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"pengin trap ling maning\", \"disc\": \"C\"}, {\"captionasli\": \"Mencoba memandang sejwuh mata memandang\", \"id\": \"1376149989822441490\", \"username\": \"kurniaarifin18\", \"captionpraproses\": \"mencoba memandang sejwuh mata memandang\", \"disc\": \"I\"}]'),
(27, 'mememmee@gmail.com', 'mememmee@gmail.com', 'L', 'fayamibunga', 4, '[{\"captionasli\": \"sawadee kha, fayay na kha \\ud83e\\udd7a\", \"id\": \"2383145941684307030\", \"username\": \"fayamibunga\", \"captionpraproses\": \"sawade kha fayay na kha\", \"disc\": \"C\"}, {\"captionasli\": \"yup.. baru liburan!\", \"id\": \"2234910169292901813\", \"username\": \"fayamibunga\", \"captionpraproses\": \"yup baru liburan\", \"disc\": \"I\"}, {\"captionasli\": \"life is not a race.\", \"id\": \"2120910321676796722\", \"username\": \"fayamibunga\", \"captionpraproses\": \"life is not a race\", \"disc\": \"C\"}, {\"captionasli\": \"Sebenernya aku mulai pikirin dan bahagiain diri sendiri, gamau liat sesuatu yang buat aku sedih, jadi gasalahkan aku membentengi diri sendiri dengan menutup akses yang membuatku sedih ?? Setiap orang pasti punya cara sendiri untuk mengembalikan semangat didalam hari-harinya.\\nPasti.\", \"id\": \"2108618581649447972\", \"username\": \"fayamibunga\", \"captionpraproses\": \"sebenernya aku mulai pikirin bahagiain diri sendiri gamau liat buat aku sedih jadi gasalahkan aku membentengi diri sendiri menutup akses yang membuatku sedih setiap orang punya cara sendiri mengembalikan semangat didalam hari harinya pasti\", \"disc\": \"S\"}]'),
(28, 'dwiapriliac_', 'dwiapriliac_@gmail.com', 'P', 'dwiapriliac_', 2, '[{\"captionasli\": \"Buat apa jadi fakgirl kalo bisa jadi ur girl. 2\", \"id\": \"2407395342382601493\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"buat apa jadi fakgirl kalo jadi ur girl 2\", \"disc\": \"S\"}, {\"captionasli\": \"Kosongan aja deh\\ud83c\\udf43\", \"id\": \"2392162737618063344\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"kosongan aja deh\", \"disc\": \"I\"}, {\"captionasli\": \"Kamu terlalu sat set buat aku yg klemar klemer\", \"id\": \"2377103687037495147\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"kamu terlalu sat set buat aku yang klemar klemer\", \"disc\": \"S\"}, {\"captionasli\": \"Dia tidak berubah hanya saja topengnya terjatuh.\\n\\u2022\\n\\ud83d\\udc55@hail.dust\", \"id\": \"2374156004945653890\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"dia berubah saja topengnya terjatuh\", \"disc\": \"C\"}, {\"captionasli\": \"Yg tunangan aja bisa ditinggalin apalagi yang cuma ditanya udah makan apa belum.\", \"id\": \"2370458762418321861\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"yang tunangan aja ditingalin yang cuma ditanya udah makan apa belum\", \"disc\": \"I\"}, {\"captionasli\": \"Selain suka foto,aku juga suka kamu.\", \"id\": \"2363214744907125606\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"selain suka foto aku suka kamu\", \"disc\": \"I\"}, {\"captionasli\": \"Permisi,kentang lewat\", \"id\": \"2357401922042251056\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"permisi kentang lewat\", \"disc\": \"C\"}, {\"captionasli\": \"Jangan berlebihan seperlunya saja\\n\\u2022\\n\\u2022\\n\\ud83d\\udcf8@bagusideas \\n\\ud83d\\udcf8@adhit_dhiki\", \"id\": \"2354516874053910667\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"jangan berlebihan seperlunya saja\", \"disc\": \"I\"}, {\"captionasli\": \"Gusti,nek semisal kulo salah dalan,tulung sharelock:)\", \"id\": \"2354513192302192470\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"gusti nek semisal kulo salah dalan tulung sharelock\", \"disc\": \"I\"}, {\"captionasli\": \"Akhirnya keliatan tinggi juga\", \"id\": \"2351601286524536566\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"akhirnya keliatan tingi\", \"disc\": \"C\"}, {\"captionasli\": \"Lv myslf\\ud83c\\udf3b\", \"id\": \"2346553315034622969\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"lv myslf\", \"disc\": \"C\"}, {\"captionasli\": \"Ikhsan Praditya - Ikhlas (full version on youtube)\\n.\\nDirected by @arshyandi_\\n\\ud83c\\udfa5 @arsh.xa\\n\\n@ruangproduction20\", \"id\": \"2345738539261787059\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"ikhsan praditya ikhlas ful version on youtube directed by\", \"disc\": \"C\"}, {\"captionasli\": \"Lekang oleh harapan dahulu aku ingin sekali mendekap, setelah kau patahkan bersamamu kini tak lagi ada harap. Segala tentangmu ialah ter semu, antara kita yang tak lagi menghadirkan temu.\\n\\u2022\\nKolaborasi @aftrsdcatalog x @kopi.kolosal \\ud83d\\udd25 \\n\\u2022\\n\\ud83d\\udcf8 @dedeachmadkustiono \\u2022  @haryono_motivator\", \"id\": \"2342115809811551569\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"lekang harapan aku sekali mendekap kau patahkan bersamamu kini tak ada harap segala tentangmu ialah ter semu kita tak menghadirkan temu kolaborasi x\", \"disc\": \"D\"}, {\"captionasli\": \"Yakin nih kalian ngga pengen pake aftersaid?yang kece dan nyaman di gunain,cuss bisa cek aja ig nya\\u2728\\n\\n@aftrsdcatalog\", \"id\": \"2340731217791883279\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"yakin nih kalian nga pengen pake aftersaid yang kece nyaman gunain cus cek aja ig nya\", \"disc\": \"I\"}, {\"captionasli\": \"Idiot plen\", \"id\": \"2336536479085828171\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"idiot plen\", \"disc\": \"C\"}, {\"captionasli\": \"if you lose something you think is good but turn around with facts, it will not hurt for us. \\n\\u2022\\n\\ud83d\\udcfd@dedeachmadkustiono\", \"id\": \"2330390458697849902\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"if you lose something you think is god but turn around with facts it wil not hurt for us\", \"disc\": \"I\"}, {\"captionasli\": \"Liat apaa\\ud83d\\ude15\", \"id\": \"2234635301561867096\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"liat apa\", \"disc\": \"S\"}, {\"captionasli\": \"But i\'m only human and i bleed when i fall down\", \"id\": \"2061697511330262102\", \"username\": \"dwiapriliac_\", \"captionpraproses\": \"but im only human and i bled when i fal down\", \"disc\": \"C\"}]'),
(29, 'chelyna_p', 'chelyna_p@gmail.com', 'P', 'chelyna_p', 4, '[{\"captionasli\": \"Makan bubur pagi-pagi,cakepppp\", \"id\": \"2376687103653485803\", \"username\": \"chelyna_p\", \"captionpraproses\": \"makan bubur pagi pagi cakep\", \"disc\": \"C\"}, {\"captionasli\": \"Sini sini sungkem dulu\", \"id\": \"2317267331044284242\", \"username\": \"chelyna_p\", \"captionpraproses\": \"sini sini sungkem dulu\", \"disc\": \"S\"}, {\"captionasli\": \"Malming kemana nih?\", \"id\": \"2208888575029137729\", \"username\": \"chelyna_p\", \"captionpraproses\": \"malming nih\", \"disc\": \"C\"}, {\"captionasli\": \"Malang aja yg dingin,kamu jangan wkwk\", \"id\": \"2207124333393206236\", \"username\": \"chelyna_p\", \"captionpraproses\": \"malang aja yang dingin kamu jangan\", \"disc\": \"I\"}, {\"captionasli\": \"Menertawai pikiranku yang random random an\", \"id\": \"2135397212694666884\", \"username\": \"chelyna_p\", \"captionpraproses\": \"menertawai pikiranku random random an\", \"disc\": \"C\"}, {\"captionasli\": \"Tau ga kalo emot \\ud83e\\udd18\\ud83c\\udffb ternyata gabungan dari ily,iya i love you hehe\", \"id\": \"2083275711229243176\", \"username\": \"chelyna_p\", \"captionpraproses\": \"tau ga kalo emot ternyata gabungan ily iya i love you hehe\", \"disc\": \"S\"}, {\"captionasli\": \"Audzubillahiminasaitonnirojim\", \"id\": \"2064648524905350454\", \"username\": \"chelyna_p\", \"captionpraproses\": \"audzubilahiminasaitonirojim\", \"disc\": \"C\"}, {\"captionasli\": \"Gatau males,pengen beli es\", \"id\": \"2032794318070429283\", \"username\": \"chelyna_p\", \"captionpraproses\": \"gatau males pengen beli es\", \"disc\": \"I\"}, {\"captionasli\": \"Bali rasa pacitan\\ud83c\\udf43\", \"id\": \"2029824043267863628\", \"username\": \"chelyna_p\", \"captionpraproses\": \"bali rasa pacitan\", \"disc\": \"I\"}, {\"captionasli\": \"Our memorise of the ocean will linger on,long after our footprints in the sand are gone\\n\\ud83d\\udcf7 @nissasitta\", \"id\": \"2009526033213512514\", \"username\": \"chelyna_p\", \"captionpraproses\": \"our memorise of the ocean wil linger on long after our fotprints in the sand are gone\", \"disc\": \"C\"}, {\"captionasli\": \"You\'re young so have fun girl \\nHiyahiyahiya\", \"id\": \"1907916185561087792\", \"username\": \"chelyna_p\", \"captionpraproses\": \"youre young so have fun girl hiyahiyahiya\", \"disc\": \"C\"}, {\"captionasli\": \"It is not your job to be everything to everyone\", \"id\": \"1773649831007158056\", \"username\": \"chelyna_p\", \"captionpraproses\": \"it is not your job to be everything to everyone\", \"disc\": \"C\"}, {\"captionasli\": \"Humans not created perfect by God, so that we can keep learning and grow to be better\", \"id\": \"1729496090590156740\", \"username\": \"chelyna_p\", \"captionpraproses\": \"humans not created perfect by god so that we can kep learning and grow to be beter\", \"disc\": \"I\"}]');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id_disc`);

--
-- Indeks untuk tabel `partisipan`
--
ALTER TABLE `partisipan`
  ADD PRIMARY KEY (`id_partisipan`),
  ADD KEY `id_disc` (`id_disc`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `disc`
--
ALTER TABLE `disc`
  MODIFY `id_disc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `partisipan`
--
ALTER TABLE `partisipan`
  MODIFY `id_partisipan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `partisipan`
--
ALTER TABLE `partisipan`
  ADD CONSTRAINT `partisipan_ibfk_1` FOREIGN KEY (`id_disc`) REFERENCES `disc` (`id_disc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
