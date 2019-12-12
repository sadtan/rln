var express = require("express")
    router  = express.Router();

const FondoController = require("../controllers/fondoController.js");
const controller = new FondoController();

var response_format = {
	success: '',
	status: '',
	data: [],
	error: []
};

function setResponse(status = 404, error = null, data = null) {
	if (error) {
		return {
			...response_format,
			status,
			error: (status === 422) ? extractErrorMessages(error) : error,
			data: [],
			success: false
		};
	} else {
		return {
			...response_format,
			status,
			data,
			success: true
		}
	}
}

router.get("/", (req, res) => controller.get_all_fondos(req, res));
router.get("/buscar", (req, res) => {res.render("fondos/buscar.ejs")});
router.post("/", (req, res) => {controller.get_fondo_by_id(req, res)});

// JSON
router.get("/json/:fondo_id", (req, res) => {
    var status = 500;
    var resp_format = {};

    controller.get_fondo_by_id_json(req, function(err, data)
    {
        if (!err) status = 200;
        if (data == "" && err == null) {
            status = 400;
            err = "no encontrado";
        }
        resp_format = setResponse(status, err, data);
        return res.status(status).json(resp_format);
    });
}) 
router.get("/json", (req, res) => {
    var status = 500;
    var resp_format = {};

    controller.get_all_fondos_json(function(err, data)
    {
        if (!err) status = 200;
        resp_format = setResponse(status, err, data);
        return res.status(status).json(resp_format);
    });
}) 

module.exports = router;