var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idFreezer", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idFreezer", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.post("/salvarNoHistorico", function (req, res) {
    medidaController.salvarNoHistorico(req, res);
});
module.exports = router;