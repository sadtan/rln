"use strict"

var sql = require("./db.js");

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


module.exports = FondoModel;
