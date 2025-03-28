<?php
include_once 'connection.php';
if($conn = mysqli_connect($host, $user, $password, $database)){
    $sqlCategories = "SELECT DISTINCT category FROM games";
    $resultCategories = mysqli_query($conn, $sqlCategories);

    $selectedCategory = isset($_GET['category']) ? $_GET['category'] : '';
    $selectedCategoryEscaped = mysqli_real_escape_string($conn, $selectedCategory);

    $items = 3;
    $current_page = isset($_GET['page']) ? $_GET['page'] : 1;
    $sql = "SELECT COUNT(*) AS total FROM games";
    $result = mysqli_query($conn, $sql);
    $totalItems = $result->fetch_assoc()['total'];
    $totalPages = ceil($totalItems / $items);
    $offset = ($current_page - 1) * $items;
    $sql = "SELECT * FROM games LIMIT $offset, $items";
    if(!empty($selectedCategory)){
        $sql = "SELECT * FROM games WHERE category = '$selectedCategoryEscaped' LIMIT $offset, $items";
    }
    $result = mysqli_query($conn, $sql);
    echo "<nav>";
    echo "<ul>";
    if(mysqli_num_rows($resultCategories) > 0){
        while($row = mysqli_fetch_assoc($resultCategories)){
            $categoryName = htmlspecialchars($row['category']);
            $categoryEncoded = urldecode($categoryName);

            if($selectedCategory == $categoryName){
                echo "<li><strong>" . $categoryName . "</strong></li>";
            }
            else{
                echo "<li><a href=\"showList.php?category=" . $categoryEncoded . "\">" . $categoryName . "</a></li>";
            }
        }
    }
    echo "</nav>";
    echo "</ul>";
    if(mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_assoc($result)){
            echo "<h3>" . $row["name"] . "</h3>";
            echo "<p>" . $row["description"] . "</p>";
            echo "<p> Цена:" . number_format($row["price"], 2) . " руб.</p>";
            echo "<hr>";
        }
    }
    else{
        echo "нет данных для отображения";
    }

    echo "<div>";
    for ($i = 1; $i <= $totalPages; $i++){
        echo "<a href='showList.php?page=$i'>$i </a>";
    }
    echo "</div>";

    $conn->close();
}
else{
    echo "Не удалось установить подключение к бд";
}
?>