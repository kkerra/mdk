```
@Composable
fun FilePickerScreen(paddingValues: PaddingValues){
    val context = LocalContext.current
    val scope = rememberCoroutineScope()
    var fileContent by remember { mutableStateOf<String?>(null) }

    val openLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenDocument(),
        onResult = {
            uri: Uri? ->
                uri?.let {
                    scope.launch{
                        fileContent = readTextFromUri(context, uri)
                    }
                }
        }
    )

    val saveLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.CreateDocument("text/plain"),
        onResult = { uri: Uri? ->
            uri?.let {
                scope.launch{
                    writeTextToUri(context, uri, fileContent ?: "")
                }
            }

        }
    )

    Column(Modifier.padding(paddingValues)) {
        Button(
            onClick = {
                openLauncher.launch(arrayOf("text/plain"))
            }
        ) {
            Text("Выбрать файл для чтения")
        }

        fileContent?.let {
            Text(text = it)
        }

        Button(
            onClick = {
                saveLauncher.launch("example.txt")
            }
        ) {
            Text("Выбрать файл для сохранения")
        }
    }
}

suspend fun writeTextToUri(context: Context, uri: Uri, text: String){
    withContext(Dispatchers.IO){
        context.contentResolver.openOutputStream(uri)?.bufferedWriter().use{ writer ->
            writer?.write(text)
        }
    }
}

suspend fun readTextFromUri(context: Context, uri: Uri): String{
    return withContext(Dispatchers.IO){
        context.contentResolver.openInputStream(uri)?.bufferedReader().use{ reader ->
            reader?.readText() ?: "Ошибка при чтении файла"
        }
    }
}

```
