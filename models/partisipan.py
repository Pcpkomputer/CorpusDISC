from flask import jsonify

class Partisipan:
    def __init__(self, id_partisipan, nama_lengkap, alamat_email, jenis_kelamin,username_instagram,hasil_pertanyaan,id_disc):
        self.id_partisipan = id_partisipan
        self.nama_lengkap = nama_lengkap
        self.alamat_email = alamat_email
        self.jenis_kelamin = jenis_kelamin
        self.username_instagram = username_instagram
        self.hasil_pertanyaan = hasil_pertanyaan
        self.id_disc = id_disc

