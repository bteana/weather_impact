import pandas as pd
import requests  # Importa la librería para enviar solicitudes al servidor
from bs4 import BeautifulSoup  # Importa la librería para analizar la página web
from pathlib import Path

URL = 'https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html'

BASE_DIR = Path(__file__).resolve().parent.parent
OUTPUT_PATH = BASE_DIR / "data" / "weather_records.csv"

def main():
    req = requests.get(URL)
    soup = BeautifulSoup(req.text, 'lxml')
    
    table = soup.find('table', attrs={"id": "weather_records"})
    
    heading_table = []  # Lista donde se almacenarán los nombres de las columnas
    for row in table.find_all('th'):  # Encontraremos todos los elementos <th> en la tabla y los ejecutaremos en un bucle (nombres de las columnas)
        heading_table.append(row.text)  # Agrega el contenido de la etiqueta <th> a la lista heading_table usando append()
    
    content = []  # lista donde se almacenarán los datos de la tabla
    for row in table.find_all('tr'):
        # Recorre todas las filas que están envueltas en una etiqueta <tr>
        if not row.find_all('th'):
            # Condición para ignorar la primera fila de la tabla con encabezados
            content.append([element.text for element in row.find_all('td')])
            # Recorre todos los elementos <td> para extraer el contenido de las celdas y agregarlo a la lista y agregar cada una de las listas a la lista de contenido
    
    weather_records = pd.DataFrame(content, columns=heading_table)
    # pasa la lista de contenido como datos y heading_table como encabezados
    weather_records.to_csv(OUTPUT_PATH, index=False)
    print("Dataset guardado correctamente")
    
if __name__ == "__main__":
    main()
