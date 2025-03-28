<?php
include_once 'connection.php';
if($conn = mysqli_connect($host, $user, $password, $database)){
    $sortBy = isset($_GET['sortBy']) ? $_GET['sortBy'] : 'name';
    $filterPrice = isset($_GET['price']) ? $_GET['price'] : null;
    $filterName = isset($_GET['name']) ? $_GET['name'] : null;
    $filterDescription = isset($_GET['description']) ? $_GET['description'] : null;
    $resetFilter = isset($_GET['filter']) && $_GET['filter'] === 'no';

    if ($resetFilter) {
        $filterPrice = null;
        $filterName = null;
        $filterDescription = null;
    }

    $sql = "SELECT * FROM games";
    $whereConditions = array();
    if ($filterPrice !== null) {
        $whereConditions[] = "price <= " . $filterPrice;
    }
    if ($filterName !== null) {
        $whereConditions[] = "name LIKE '%" . $filterName . "%'";
    }
    if ($filterDescription !== null) {
        $whereConditions[] = "description LIKE '%" . $filterDescription . "%'";
    }
    if (!empty($whereConditions)) {
        $sql .= " WHERE " . implode(" AND ", $whereConditions);
    }
    $sql .= " ORDER BY $sortBy";
    $result = $conn->query($sql);

    echo "<form action='showTable.php' method='GET'>";
    echo "<input type='radio' name='sortBy' value='name' " . ($sortBy == 'name' ? 'checked' : '') . "> Сортировать по названию";
    echo "<input type='radio' name='sortBy' value='price' " . ($sortBy == 'price' ? 'checked' : '') . "> Сортировать по цене";
    echo "<br>";
    echo "Фильтровать по цене до: <input type='text' name='price' value='" . ($filterPrice !== null ? $filterPrice : '') . "'>";
    echo "<br>";
    echo "Фильтровать по названию: <input type='text' name='name' value='" . ($filterName !== null ? $filterName : '') . "'>";
    echo "<br>";
    echo "Фильтровать по описанию: <input type='text' name='description' value='" . ($filterDescription !== null ? $filterDescription : '') . "'>";
    echo "<button type='submit' name='filter' value='yes'>Применить</button>";
    echo "<button type='submit' name='filter' value='no'>Очистить</button>";
    echo "</form>";

    echo "<table border='1'>";
    echo "<tr>";
    echo "<th><a href='showTable.php?sortBy=name'>Название</a></th>";
    echo "<th><a href='showTable.php?sortBy=description'>Описание</a></th>";
    echo "<th><a href='showTable.php?sortBy=price'>Цена</a></th>";
    echo "</tr>";

    if(mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_assoc($result)){
            echo "<tr>";
            echo "<td>" . $row["name"] . "</td>";
            echo "<td>" . $row["description"] . "</td>";
            echo "<td> Цена:" . number_format($row["price"], 2) . " руб.</td>";
            echo "</tr>";
        }
    }
    else{
        echo "нет данных для отображения";
    }
    echo "</table>";
    $conn->close();
}
else{
    echo "Не удалось установить подключение к бд";
}
?>
