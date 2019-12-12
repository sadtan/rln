"use strict"

var FondoModel = require("../models/fondoModel");
var Fondo = new FondoModel();

class TextileController {
    get_all_fondos(req, res) {
        Fondo.GetAllFondos(function (err, data) {
            if (err) res.send(err);
            else 
            {
                res.render("fondos/show.ejs", { data });
            }
            
        })
    }

    get_fondo_by_id(req, res) {
        //res.send(req.body);
        if (!isNaN(req.body.data)) {
            Fondo.GetById(req.body.data, function (err, fondo) {
                if (err) console.log(err);
                res.send(fondo);
            })
        }
        else res.send({data: "Solo numeros."});
    }

    // JSON
    get_fondo_by_id_json(req, result) {
        Fondo.GetById(req.params.fondo_id, function(err, fondo) {
            if (err) {
                result(err, null)
            }
            else {
                result(null, fondo);
            }
        })
    };

    get_all_fondos_json(result) {
        Fondo.GetAllFondos(function(err, fondo) {
            if (err) {
                result(err, null)
            }
            else {
                result(null, fondo);
            }
        })
    };
}

module.exports = TextileController;