const graphic = {
    type: "line",
    data: {
        labels: ["12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00"],
        datasets: [
            {
                label: "Temperatura no freezer",
                data: [-26.1, -25.9, -22.4, -23.6, -20, -27.3, -25, -22, -20],
                backgroundColor: "#FF3596",
                borderColor: "#FF3596"
            }
        ]
    },

    options: {
        maintainAspectRatio: false
    }
}

var mychartLine = new Chart(document.getElementById("lineChart"), graphic)