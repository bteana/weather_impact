# Impacto del clima en la duración de viajes en taxi (Chicago)

Proyecto de análisis de datos enfocado en comprender cómo factores externos —especialmente el clima— influyen en la duración de los viajes en taxi entre el Loop y el aeropuerto O'Hare.

---

## Objetivo del proyecto

Analizar datos de viajes y condiciones meteorológicas para identificar patrones de comportamiento de los usuarios y validar la hipótesis:

> *La duración promedio de los viajes desde el Loop hasta el Aeropuerto Internacional O'Hare cambia los sábados lluviosos.*

---

## Tecnologías utilizadas

* Python (Pandas, NumPy, Matplotlib, SciPy)
* SQL (consultas, joins, agrupaciones, CASE)
* Web Scraping (BeautifulSoup)
* Jupyter Notebook
* Git & GitHub

---

## Estructura del repositorio

```
weather_impact/
│
├── src/                  # Script para obtener datos climáticos desde la web
├── sql/                  # Consultas SQL utilizadas en el análisis
├── data/                 # Dataset generado automáticamente
├── images/               # Gráficas del análisis
├── notebooks/            # Análisis exploratorio y prueba de hipótesis
├── requirements.txt
└── README.md
```

---

##  Análisis exploratorio de datos

### Empresas de taxi vs número de viajes

![Viajes por empresa](images/companies_trips.png)

**Conclusión:**

> (Escribe aquí tu interpretación: qué significa la concentración de viajes para el negocio)

---

### Top 10 barrios por número de finalizaciones

![Top barrios](images/top_neighborhoods.png)

**Conclusión:**

> (Explica qué indican las zonas de mayor demanda y cómo podría usarse esa información)

---

### Distribución de duración de viajes

![Distribución duración](images/duration_distribution.png)

**Conclusión:**

> (Describe qué implica la forma de la distribución para la operación del servicio)

---

## Prueba de hipótesis

### Hipótesis nula (H0)

La duración promedio de los viajes no cambia en sábados lluviosos.

### Hipótesis alternativa (H1)

La duración promedio de los viajes sí cambia en sábados lluviosos.

### Nivel de significancia

α = 0.05

### Resultado estadístico

p-value = **(coloca aquí tu valor)**

### Decisión

(Según tu resultado: rechazar o no rechazar H0)

### Interpretación de negocio

> (Explica qué debería hacer la empresa con este resultado: precios dinámicos, estimaciones de tiempo, asignación de conductores, etc.)

---

## Aprendizajes

* Integración de datos desde múltiples fuentes (web + base de datos)
* Limpieza y preparación de datos
* Análisis exploratorio orientado a negocio
* Validación de hipótesis con pruebas estadísticas
* Comunicación de resultados mediante visualizaciones

---

## Autor

Ana Bustamante
[LinkedIn](https://www.linkedin.com/in/anaebustamante/)
[GitHub](https://github.com/bteana)
