var express = require("express")
    router  = express.Router();

const FondoController = require("../controllers/FondoController.js");
const controller = new FondoController();

router.get("/", (req, res) => controller.get_all_fondos(req, res));
router.get("/buscar", (req, res) => {res.render("fondos/buscar.ejs")});
router.post("/", (req, res) => {controller.get_fondo_by_id(req, res)});

module.exports = router;