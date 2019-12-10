var express = require("express"),
    router = express.Router();

router.get("/", (req, res) =>
{
    res.redirect("/fondos");
});

router.get("*", (req, res) =>
{
    res.redirect("/fondos");
});


module.exports = router;