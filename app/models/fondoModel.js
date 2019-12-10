"use strict"

var sql = require("./db.js");

class FondoModel
{

    GetAllFondos = function(result)
    {
        sql.query("select fondos.fondo_id, fondos.fondo_nombre, lugares.lugar_lat, lugares.lugar_long FROM fondos INNER JOIN lugares ON fondos.fk_lugar = lugares.lugar_id", (err, res) => 
        {
            if (err) 
            {
                console.log("Fondos Model Error: ", err);
                result(null, err);
            }
            else 
            {
                result(null, res);
            }
        })
    }

    GetFondoLugar = function(LugarId, result, hola)
    {
        sql.query("SELECT lugar_lat, lugar_long FROM lugares WHERE lugar_id = " + LugarId, (err, res) => 
        {
            if (err) 
            {
                console.log("Fondos Model Error: ", err);
                result(null, err);
            }
            else 
            {

                result(null, res)
            }
        })
    }

    GetById = function(FondoId, result)
    {
        sql.query("SELECT * FROM fondos WHERE fondo_id =" + FondoId, (err, res) =>
        {
            if (err) 
            {
                console.log("Fondos Model Error: ", err);
                result(null, err);
            }
            else 
            {
                result(null, res);
            }
        });
    }

}
module.exports = FondoModel;
