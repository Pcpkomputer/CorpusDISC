from koneksi.koneksi import mydb
from models.partisipan import Partisipan
from flask import jsonify

class ControllerPartisipan:
    def __init__(self,partisipan):
        if partisipan != None:
            self.partisipan = partisipan
        else:
            self.partisipan = None
    def create(self):
        try:
            cursor = mydb.cursor()
            query = 'INSERT INTO partisipan VALUES (NULL,%s,%s,%s,%s,%s,%s)'
            cursor.execute(query,(self.partisipan.nama_lengkap,self.partisipan.alamat_email,self.partisipan.jenis_kelamin,self.partisipan.username_instagram,self.partisipan.hasil_pertanyaan,self.partisipan.id_disc))
            mydb.commit()
            return True
        except Exception as e:
            raise ValueError(e)
      
    
    def read(self):
        try:
            cursor = mydb.cursor()
            query = 'SELECT * FROM partisipan ORDER BY id_partisipan DESC'
            cursor.execute(query)
            hasil = cursor.fetchall()
            return hasil
        except:
            raise ValueError("err")

    def readsatu(self, id):
        try:
            cursor = mydb.cursor()
            query = 'SELECT partisipan.*,disc.* FROM partisipan INNER JOIN disc ON disc.id_disc=partisipan.id_disc WHERE partisipan.id_partisipan=%s'
            cursor.execute(query,(id,))
            hasil = cursor.fetchone()
            return hasil
        except:
            raise ValueError("err")
    
    def update(self):
        try:
            cursor = mydb.cursor()
            query = 'UPDATE partisipan SET nama_lengkap=%s,alamat_email=%s,jenis_kelamin=%s,username_instagram=%s WHERE id_partisipan=%s'
            cursor.execute(query,(self.partisipan.nama_lengkap,self.partisipan.alamat_email,self.partisipan.jenis_kelamin,self.partisipan.username_instagram,self.partisipan.id_partisipan))
            mydb.commit()
            return True
        except Exception as e:
            raise ValueError(e)
    
    def delete(self,id_partisipan):
        try:
            cursor = mydb.cursor()
            query = 'DELETE FROM partisipan WHERE id_partisipan={}'.format(id_partisipan)
            cursor.execute(query)
            mydb.commit()
            return True
        except Exception as e:
            raise ValueError(e)