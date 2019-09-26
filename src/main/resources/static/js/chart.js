document.addEventListener("DOMContentLoaded", function () {

    google.charts.load("current", {packages: ["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

    let chartData = document.getElementById("piechart_3d").dataset.chartdata;
    let strings = chartData.split(";");

    function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Gra');
        data.addColumn('number', 'Liczba ogłoszeń na stronie');
        strings.forEach(function (string) {
            let tab = string.split(",");
            data.addRow([tab[0], parseInt(tab[1])])
            console.log(tab[0]);
            console.log(tab[1]);
        });


        var options = {
            title: 'Popularność gier wg. ilości ogłoszeń na stronie',
            is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
    }
});

