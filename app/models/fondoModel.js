"use strict"

var sql = require("./db.js");
const crypto = require('crypto');
const algorithm = 'aes-256-cbc';
const key = crypto.randomBytes(32);
const iv = crypto.randomBytes(16);


class FondoModel
{
    GetAllFondos(result)
    {
        sql.query("select fondos.fondo_id, fondos.fondo_nombre, lugares.lugar_lat, lugares.lugar_long FROM fondos INNER JOIN lugares ON fondos.fk_lugar = lugares.lugar_id", (err, res) => 
        {
            if (err) 
            {
                result(null, err);
            }
            else 
            {
                result(null, res);
            }
        })
    }
    
    GetById(FondoId, result)
    {
        sql.query("SELECT * FROM fondos WHERE fondo_id =" + sql.escape(FondoId), (err, res) =>
        {
            if (err) 
            {
                
                result(err, null);
            }
            else 
            {
                
                result(null, res);
            }
        });
    }
}

function encrypt(text) {
    let cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(key), iv);
    let encrypted = cipher.update(text);
    encrypted = Buffer.concat([encrypted, cipher.final()]);
    return { iv: iv.toString('hex'), encryptedData: encrypted.toString('hex') };
}
   
function decrypt(text) {
    let iv = Buffer.from(text.iv, 'hex');
    let encryptedText = Buffer.from(text.encryptedData, 'hex');
    let decipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(key), iv);
    let decrypted = decipher.update(encryptedText);
    decrypted = Buffer.concat([decrypted, decipher.final()]);
    return decrypted.toString();
}

function EncryptCelular() {
    sql.query("SELECT fondo_responsable_celular FROM fondos", (err, res) =>
    {
        if (err) 
        {
            console.log(err);
        }
        else 
        {
            var dataToEncrypt = false;
            res.forEach((cell) => {
                
                if (!isNaN(cell["fondo_responsable_celular"])) 
                {
                    dataToEncrypt = true;
                    var encrytedData = encrypt(cell["fondo_responsable_celular"])["encryptedData"];
                    sql.query(
                        'UPDATE fondos SET fondo_responsable_celular = "' + encrytedData + '" WHERE fondo_responsable_celular = "' + cell["fondo_responsable_celular"] + '"',
                        (err, res) => {
                            if (err) console.log(err);
                            //else console.log(res);
                        }
                    );
                }

            });
            if (!dataToEncrypt) console.log("Ningun dato fue encriptado");
            else console.log("Info encriptada correctamente");
        }
    })
};

EncryptCelular();

module.exports = FondoModel;
