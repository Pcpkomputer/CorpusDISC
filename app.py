from flask import Flask,redirect,url_for,request,render_template,session
from models.partisipan import Partisipan
from controllers.controllerPartisipan import ControllerPartisipan
import json
from koneksi.koneksi import mydb
import subprocess
import os
import re
import emoji
import re
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import confusion_matrix
from sklearn.utils import shuffle
from joblib import dump,load
import pandas as pd
from Sastrawi.StopWordRemover.StopWordRemoverFactory import StopWordRemoverFactory
import numpy as np

app = Flask(__name__)
app.secret_key = "visqdelica"

def make_model():
    file = pd.read_csv("dataset.csv")
    file = file.loc[file["caption"].notnull()]
    d = file.loc[file["hasil"]=="D"]
    i = file.loc[file["hasil"]=="I"]
    s = file.loc[file["hasil"]=="S"]
    c = file.loc[file["hasil"]=="C"]
    #jumlah persebaran data sebelum diseimbangkan
    print("jumlah persebaran data sebelum diseimbangkan")
    print(len(d),len(i),len(s),len(c))
    #membagi persebaran data menjadi seimbang 200 untuk seluruh kategori dengan random_state senilai 15
    print("membagi persebaran data menjadi seimbang 150 untuk seluruh kategori dengan random_state 0")
    d = shuffle(d, random_state=0)[:150]
    i = shuffle(i, random_state=0)[:150]
    s = shuffle(s, random_state=0)[:150]
    c = shuffle(c, random_state=0)[:150]
    print(len(d),len(i),len(s),len(c))
    hasil = pd.concat([d,i,s,c])
    X = hasil["caption"]
    y = hasil["hasil"]
    vectorizer = TfidfVectorizer(min_df=0.0, max_df=1.0, sublinear_tf=True, use_idf=True, stop_words='english')
    #X_train, X_test, y_train, y_test = train_test_split(X,y, test_size=0.1, random_state=25)
    #print("membagi data test menjadi perbandingan 0.1 dengan random_state=25")
    X_train_tf = vectorizer.fit_transform(X)
    #X_test_tf = vectorizer.transform(X_test)
    model = MultinomialNB()
    model.fit(X_train_tf, y)
    #result = model.predict(X_test_tf)
    from sklearn.metrics import classification_report
    from sklearn.metrics import accuracy_score
    #matrix = confusion_matrix(y_test,result,labels=["D","I","S","C"])
    #accuracy = accuracy_score(y_test,result)
    #print(matrix)
    #print(accuracy)
    return model,vectorizer

def prediksi(model, vectorizer, kalimat):
    r = vectorizer.transform([kalimat])
    return model.predict(r)[0]

def linekereta(string):
    a=string.split(" ")
    tt = []
    for x in a:
        local=None
        jirbg = []
        for i in x:
            if local==i:
                pass
            else:
                jirbg.append(i)
                local=i
        tt.append("".join(jirbg))
    return " ".join(tt)


def penggal(str):
    factory = StopWordRemoverFactory()
    stopword = factory.create_stop_word_remover()
   #### MELAKUKAN PROSES STEMMING STOPWORD BAHASA INDONESIA
    try:
        #satu = re.sub(r"RT.*"," ",a["text"][x])
        satu = stopword.remove(str)
    except:
        pass
    
    #### MENGHILANGKAN TEXT TIDAK PENTING SEPERTI HASHTAG DAN MENTION
    dua = re.sub(r"Rp.[\d\.]+"," ",satu)
    dua = re.sub(r"@[^\s]+"," ",satu)
    dua = re.sub(r"#[^\s]+"," ",dua)
    dua = re.sub(r"\?"," ",dua)
    dua = re.sub(r","," ",dua)
    dua = re.sub(r"”"," ",dua)
    dua = re.sub(r"co/[^\s]+"," ",dua)
    dua = re.sub(r":'\)"," ",dua)
    dua = re.sub(r":\)","",dua)
    dua = re.sub(r"&"," ",dua)
    dua = re.sub(r'\"([^\"]+)\"',"\g<1>",dua)
    dua = re.sub(r'\([^\)]+\"',"",dua)
    dua = re.sub(r'\((.+)\)',"\g<1>",dua)
    dua = re.sub(r'-'," ",dua)
    dua = re.sub(r':\('," ",dua)
    dua = re.sub(r'\('," ",dua)
    dua = re.sub(r'\)'," ",dua)
    #dua = re.sub(r"'"," ",dua)
    dua = re.sub(r'"'," ",dua)
    dua = re.sub(r';'," ",dua)
    dua = re.sub(r':v'," ",dua)
    dua = re.sub(r'²'," ",dua)
    dua = re.sub(r':"\)'," ",dua)
    dua = re.sub(r'\[\]'," ",dua)
    dua = re.sub(r'“',"",dua)
    dua = re.sub(r'_'," ",dua)
    dua = re.sub(r'—'," ",dua)
    dua = re.sub(r'…'," ",dua)
    dua = re.sub(r'='," ",dua)
    dua = re.sub(r'\[\w+\]'," ",dua)
    dua = re.sub(r'!'," ",dua)
    #dua = re.sub(r"'"," ",dua)
    dua = re.sub(r'\s+'," ",dua)
    dua = re.sub(r'^RT',"",dua) 
    dua = re.sub(r'\s+$',"",dua)   
    dua = re.sub(r'^\s+',"",dua)
    dua = re.sub(r"http.*","",dua)
    #### MENGUBAH CASE KATA MENJADI LOWERCASE
    tiga = dua.lower()
    tiga = re.sub(r"\srt\s"," ",tiga)
    tiga = re.sub(r"\srt"," ",tiga)
    tiga = re.sub(r"\."," ",tiga)
    tiga = re.sub(r"`"," ",tiga)
    tiga = re.sub(r"wk°wk", "",tiga)
    tiga = re.sub(r"[^a-zA-Z0-9\s]","",tiga)
    #### MENGUBAH KATA KEKINIAN MENJADI SESUAI PUEBI
    tiga = re.sub(r"td", "tadi",tiga)
    tiga = re.sub(r"lg", "lagi",tiga)
    tiga = re.sub(r"lg", "lagi",tiga)
    tiga = re.sub(r"dg", "dengan",tiga)
    tiga = re.sub(r"org", "orang",tiga)
    tiga = re.sub(r"km", "kamu",tiga)
    tiga = re.sub(r"sngaja", "sengaja",tiga)
    tiga = re.sub(r"yg", "yang",tiga)
    tiga = re.sub(r"gak", "tidak",tiga)
    tiga = re.sub(r"adl", "adalah",tiga)
    tiga = re.sub(r"wk", "",tiga)
    tiga = re.sub(r"bngt", "banget",tiga)
    tiga = re.sub(r"bgt", "banget",tiga)
    tiga = re.sub(r"\sn\s", " dan ",tiga)
    tiga = re.sub(r"\s\d\s", " ",tiga)

    tiga = linekereta(tiga)
    tiga = re.sub(r'^\s+',"",tiga)
    tiga = re.sub(r'\s+$',"",tiga)
    tiga = re.sub(r'\s+'," ",tiga)

    return tiga


model,vectorizer = make_model()


@app.route("/", methods=["POST","GET"])
def index():
    #if request.args.get("name") != None:
    #    pertanyaan = [{"satu":{"pilihan":"Memberi semangat","prefix":"I"},"dua":{"pilihan":"Petualang","prefix":"D"},"tiga":{"pilihan":"Teliti","prefix":"C"},"empat":{"pilihan":"Mudah menyesuaikan diri","prefix":"S"}},{"satu":{"pilihan":"Berpendirian Teguh","prefix":"C"},"dua":{"pilihan":"Suka bercerita","prefix":"I"},"tiga":{"pilihan":"Senang membujuk","prefix":"D"},"empat":{"pilihan":"Suka kedamaian","prefix":"S"}},{"satu":{"pilihan":"Mau mengalah","prefix":"S"},"dua":{"pilihan":"Suka berkorban","prefix":"C"},"tiga":{"pilihan":"Pandai bergaul","prefix":"I"},"empat":{"pilihan":"Berkemauan Kuat","prefix":"D"}},{"satu":{"pilihan":"Penuh pertimbangan","prefix":"C"},"dua":{"pilihan":"Senang dibimbing","prefix":"S"},"tiga":{"pilihan":"Suka bersaing","prefix":"D"},"empat":{"pilihan":"Suka meyakinkan","prefix":"I"}}]
    #    return render_template("pertanyaan.html", pertanyaan=enumerate(pertanyaan), nama=request.args.get("name"), email=request.args.get("email"),jeniskelamin=request.args.get("jeniskelamin"),usernameinstagram=request.args.get("usernameinstagram"))
    if request.args.get("type")=="error":
        return render_template("index.html",error=True,msg=request.args.get("msg"))
    return render_template("index.html")

@app.route("/hasil", methods=["POST","GET"])
def hasil():
    if request.method == "POST":
        nama = request.form["name"]
        email = request.form["email"]
        jenkel = request.form["jeniskelamin"]
        insta = request.form["usernameinstagram"]
        payload = []
        cursor = mydb.cursor()
        cursor.execute("SELECT * FROM partisipan WHERE alamat_email=%s",(request.form["email"],))
        h = cursor.fetchone()
        if h==None:
            subprocess.run(["instagram-scraper",insta,"--media-metadata","--media-types","none","--destination","metadata"])
            try:
                if os.path.isfile("metadata/{}.json".format(insta)):
                    file = open("metadata/{}.json".format(insta),"r",encoding="utf-8")
                    x = file.read()
                    j = json.loads(x)
                    for x in range(len(j["GraphImages"])):
                        l = {}
                        if len(j["GraphImages"][x]["edge_media_to_caption"]["edges"])==0:
                            pass
                        else:
                            l["captionasli"]=j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"]
                            pr = penggal(j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"])
                            print(pr)
                            if len(pr)==0 or pr=="-":
                                pass
                            else:
                                l["id"]=j["GraphImages"][x]["id"]
                                l["username"]=insta
                                l["captionpraproses"]=penggal(j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"])
                       
                        l["disc"]=prediksi(model,vectorizer,pr)
                        #print(emoji.demojize(j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"]))
                        if len(l)==5:
                            payload.append(l)
                else:
                    return redirect(url_for("index",type="error",msg="Akun tidak ada atau terkunci!"))
            except Exception as e:
                return redirect(url_for("index",type="error",msg=e))
                
            maksimal = [0,0,0,0]
            for x in payload:
                if x["disc"]=="D":
                    maksimal[0]=maksimal[0]+1
                elif x["disc"]=="I":
                    maksimal[1]=maksimal[1]+1
                elif x["disc"]=="S":
                    maksimal[2]=maksimal[2]+1
                elif x["disc"]=="C":
                    maksimal[3]=maksimal[3]+1
            maxx = np.argmax(maksimal)+1
                
            dump = json.dumps(payload)

            cursor.execute("INSERT INTO partisipan VALUES (NULL,%s,%s,%s,%s,%s,%s)",(nama,email,jenkel,insta,str(maxx),dump))
            mydb.commit()
                
            cursor.execute("SELECT * FROM disc WHERE id_disc={}".format(maxx))
            prefix = cursor.fetchone()

            return render_template("hasil.html",nama=nama, email=email, jeniskelamin=jenkel, usernameinstagram=insta,data=dump,penjelasan=prefix[2],kelebihan=prefix[3],kekurangan=prefix[4])
        else:
            return redirect(url_for("index",type="error",msg="Email sudah terdaftar!")) 
    else:
        return redirect(url_for("index"))


@app.route("/admin", methods=["POST","GET"])
def admin():
    if 'admin' in session:
        return redirect(url_for("dashboard"))
    if request.method=='POST':
        email = request.form["email"]
        password = request.form["password"]
        if len(email)==0 or len(password)==0:
            return render_template("admin.html",type="danger",msg="Masukkan data login!")
        cursor = mydb.cursor()
        cursor.execute("SELECT * FROM admin WHERE email=%s", (email,))
        adm = cursor.fetchone()
        if adm:
            e = adm[1]
            p = adm[2]
            if e==email and p==password:
                session["admin"]=True
                return redirect(url_for("dashboard"))
            else:
                return render_template("admin.html",type="danger",msg="Login gagal!")
        else:
            return render_template("admin.html",type="danger",msg="Akun tidak ditemukan!")
    return render_template("admin.html")

@app.route("/dashboard")
def dashboard():
    if 'admin' not in session:
        return redirect(url_for("admin"))
    cursor=mydb.cursor()
    cursor.execute("SELECT count(*) FROM partisipan")
    a = cursor.fetchone()
    b = len(os.listdir("metadata"))

    cursor.execute("SELECT disc.nama_disc,COUNT(disc.nama_disc) AS jml FROM partisipan INNER JOIN disc ON disc.id_disc=partisipan.id_disc WHERE nama_disc REGEXP '^D' GROUP BY disc.nama_disc")
    d=cursor.fetchone()
    cursor.execute("SELECT disc.nama_disc,COUNT(disc.nama_disc) AS jml FROM partisipan INNER JOIN disc ON disc.id_disc=partisipan.id_disc WHERE nama_disc REGEXP '^I' GROUP BY disc.nama_disc")
    i=cursor.fetchone() 
    cursor.execute("SELECT disc.nama_disc,COUNT(disc.nama_disc) AS jml FROM partisipan INNER JOIN disc ON disc.id_disc=partisipan.id_disc WHERE nama_disc REGEXP '^S' GROUP BY disc.nama_disc")
    s=cursor.fetchone()
    cursor.execute("SELECT disc.nama_disc,COUNT(disc.nama_disc) AS jml FROM partisipan INNER JOIN disc ON disc.id_disc=partisipan.id_disc WHERE nama_disc REGEXP '^C' GROUP BY disc.nama_disc")
    c=cursor.fetchone() 
    
    d = 0 if d==None else d[1]
    i = 0 if i==None else i[1]
    s = 0 if s==None else s[1]
    c = 0 if c==None else c[1]

    print(d,i,s,c)

    return render_template("dashboard.html",a=a[0],b=b, d=d, i=i, s=s, c=c)


########### ROUTER PARTISIPAN ##################################


@app.route("/dashboard/partisipan")
def pengguna():
    if 'admin' not in session:
        return redirect(url_for("admin"))
    ctrlPartisipan = ControllerPartisipan(None)
    partisipan = ctrlPartisipan.read()
    dictionary = map(lambda x: {"id":x[0],"nama":x[1],"email":x[2],"instagram":x[4]},partisipan)
    if request.args.get("show"):
        return render_template("pengguna.html", data=json.dumps(list(dictionary)), notifikasi={"type":request.args.get("type"),"msg":request.args.get("msg")})
    else:
        return render_template("pengguna.html", data=json.dumps(list(dictionary)))

@app.route("/dashboard/partisipan/edit/<int:id>", methods=["POST","GET"])
def editpengguna(id):
    if 'admin' not in session:
        return redirect(url_for("admin"))
    if request.method == "POST":
        try:
            id = request.form.get("id")
            nama = request.form.get("name")
            email = request.form.get("email")
            jeniskelamin = request.form.get("jeniskelamin")
            usernameinstagram = request.form.get("usernameinstagram")

            p = Partisipan(id,nama,email,jeniskelamin,usernameinstagram,None,None)
            c = ControllerPartisipan(p)
            c.update()

            return redirect(url_for("pengguna",show="notifikasi",type="success",msg="Data berhasil diubah!"))
        except Exception as e:
            return redirect(url_for("pengguna",show="notifikasi",type="danger",msg=e))
       

    partisipan = id
    cursor = mydb.cursor()
    query = "SELECT * FROM partisipan WHERE id_partisipan = %s;"
    cursor.execute(query,(partisipan,))
    hasil = cursor.fetchone()
    if hasil==None:
        return redirect(url_for("pengguna"))
    return render_template("editpengguna.html", data=hasil)

@app.route("/dashboard/partisipan/detail/<int:id>")
def detailpengguna(id):
    if 'admin' not in session:
        return redirect(url_for("admin"))
    partisipan = id
    c = ControllerPartisipan(None)
    hasil = c.readsatu(partisipan)

    disc = hasil[8]
    penjelasan = hasil[9]
    kelebihan = hasil[10]
    kekurangan = hasil[11]
    hasil_ = json.loads(hasil[6])

    maksimal = [0,0,0,0]
    for x in hasil_:
        if x["disc"]=="D":
            maksimal[0]=maksimal[0]+1
        elif x["disc"]=="I":
            maksimal[1]=maksimal[1]+1
        elif x["disc"]=="S":
            maksimal[2]=maksimal[2]+1
        elif x["disc"]=="C":
            maksimal[3]=maksimal[3]+1

    d_ = maksimal[0]
    i_ = maksimal[1]
    s_ = maksimal[2]
    c_ = maksimal[3]

    payload = []

    cursor = mydb.cursor()


    #subprocess.run(["instagram-scraper",hasil[4],"--media-metadata","--media-types","none","--destination","metadata"])
    #if os.path.isfile("metadata/{}.json".format(hasil[4])):
    #    file = open("metadata/{}.json".format(hasil[4]),"r",encoding="utf-8")
    #    x = file.read()
    #    j = json.loads(x)
    #    for x in range(len(j["GraphImages"])):
    #        l = {}
    #        l["id"]=j["GraphImages"][x]["id"]
    #        l["username"]=hasil[4]
    #        l["captionasli"]=j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"]
    #        l["captionpraproses"]=j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"]
    #        l["disc"]="Dominance"
    #        print(emoji.demojize(j["GraphImages"][x]["edge_media_to_caption"]["edges"][0]["node"]["text"]))
    #        payload.append(l)
    #else:
    #    payload=[]


    return render_template("detailpengguna.html",caption=json.dumps(hasil_),disc=disc,penjelasan=penjelasan,kelebihan=kelebihan,kekurangan=kekurangan, d=d_, i=i_, s=s_,c=c_)

@app.route("/dashboard/partisipan/hapus/<int:id>")
def hapuspengguna(id):
    if 'admin' not in session:
        return redirect(url_for("admin"))
    try:
        partisipan = id
        c = ControllerPartisipan(None)
        c.delete(partisipan)
        return redirect(url_for("pengguna",show="notifikasi",type="danger",msg="Data berhasil dihapus!"))
    except Exception as e:
        return redirect(url_for("pengguna",show="notifikasi",type="danger",msg=e))


################################################################

@app.route("/logout")
def logout():
    session.pop("admin", None)
    return redirect(url_for("admin"))



if __name__=='__main__':
    app.run(debug=True)