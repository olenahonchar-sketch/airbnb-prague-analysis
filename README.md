Аналіз ринку Airbnb у Празі

Про проєкт
Цей проєкт містить аналіз даних Airbnb у Празі на основі відкритих даних Inside Airbnb.  
Аналіз виконано з використанням SQL, попереднє очищення даних - у Python.

Дата: Березень 2026  
Джерело даних: Inside Airbnb (вересень 2025)

Методологія

1. Дані
- Дані завантажено з Inside Airbnb (зріз за вересень 2025)
- Очищення виконано в Python:
  - Видалено викиди по ціні (залишено квартири до $231)
  - Видалено райони з <5 оголошеннями
  - Видалено помилкові записи (minimum_nights > 365)
- Фінальний датасет: 7453 оголошення

2. Розрахунки
Прогнозований річний дохід розраховано за формулою:
income = price_usd × (365 - availability_365)
де 'availability_365' - кількість днів у наступні 365, коли квартира доступна.

Висновок: Найвищий прогнозований дохід у центрі (Praha 1,2,3), але Praha 18 показує аномально високий дохід при малій кількості оголошень.

Питання 2: Професіонали vs Аматори

Висновок: Професіонали домінують на ринку (73% оголошень), беруть вищу ціну (+17%), але мають нижчу зайнятість. Підсумковий дохід лише на 5.5% вищий, ніж у аматорів.

Питання 3: Інвестиційна привабливість
Найкраще співвідношення ціни та зайнятості:
1. Praha 2 - оптимальний баланс
2. Praha 3 - низька ціна, висока зайнятість
3. Praha 10 - хороший потенціал

Питання 4: Вплив minimum_nights

Висновок: Найвигідніше встановлювати мінімум 3-4 ночі. Стратегія "1 ніч" дає найнижчий дохід через низьку зайнятість.

Коментар
Як особа з досвідом управління подобовою орендою в Україні, можу порівняти два ринки. У Празі 73% ринку контролюють професіонали з 5+ квартирами - це ознака зрілого бізнесу. Цікаво, що аматори при нижчій ціні мають вищу зайнятість (177 vs 167 днів), що підтверджує мій досвід: особистий підхід часто важливіший за ідеальну ціну.
Найбільше вражає, що навіть при 50% зайнятості власник квартири в Празі отримує $16,000-20,000 чистого доходу. Для порівняння: в Україні при суборенді з аналогічною ціною, після вирахування оренди власнику ($800-1000/міс), чистий дохід був би $5,000-7,000. Це пояснює, чому в Празі бізнес масштабується, а в Україні залишається аматорським.

Обмеження аналізу
- Дані відображають прогнозований, а не фактичний дохід
- Аналіз базується на зрізі даних за вересень 2025

Використані інструменти
- Python (pandas) - очищення даних
- PostgreSQL / DBeaver - SQL запити
- GitHub - зберігання проєкту

Файли
- 'prague_airbnb_analysis.sql'- SQL запити для всіх чотирьох питань
- '*csv`- результати виконання запитів

---------------------------------------------------------------------------------------------------------------------------------------------
Airbnb Prague Market Analysis

About the Project
This project analyzes Airbnb listings in Prague based on open data from Inside Airbnb.
The analysis was performed using SQL, with preliminary data cleaning in Python.

Date: March 2026  
Data Source: Inside Airbnb (September 2025 snapshot)

Methodology

Data
- Data downloaded from Inside Airbnb (September 2025 snapshot)
- Data cleaning performed in Python:
  - Removed price outliers (kept listings under $231)
  - Removed districts with <5 listings
  - Removed erroneous records (minimum_nights > 365)
  Final dataset: 7453 listings

Calculations
Predicted annual income is calculated using the formula:
income = price_usd × (365 - availability_365)
where 'availability_365' is the number of days in the next 365 that the listing is available.

Results

Question 1: Income by District
Conclusion: The highest predicted income is in the city center (Prague 1,2,3), but Prague 18 shows anomalously high income with a small number of listings.

 Question 2: Professionals vs Amateurs
Conclusion: Professionals dominate the market (73% of listings), charge higher prices (+17%), but have lower occupancy. Final income is only 5.5% higher than amateurs.

Question 3: Investment Attractiveness
Best price-occupancy ratio:
- Prague 2 - optimal balance
- Prague 3 - low price, high occupancy
- Prague 10 - good potential

Question 4: Impact of Minimum Nights
Conclusion: The most profitable minimum stay is 3-4 nights. The "1 night" strategy yields the lowest income due to low occupancy.

Commentary
As someone with experience in short-term rental management in Ukraine, I can compare the two markets. In Prague, 73% of the market is controlled by professionals with 5+ apartments - a sign of a mature business. Interestingly, amateurs with lower prices have higher occupancy (177 vs 167 days), which confirms my experience: personal approach is often more important than the perfect price.
Most striking is that even with 50% occupancy, a property owner in Prague earns $16,000-20,000 in net income. For comparison: in Ukraine, with subletting at a similar price, after deducting rent to the owner ($800-1000/month), net income would be $5,000-7,000. This explains why business scales in Prague but remains amateur in Ukraine.

Limitations
- Data reflects predicted, not actual, income
- Analysis is based on a September 2025 data snapshot

Tools Used
- Python (pandas) - data cleaning
- PostgreSQL / DBeaver - SQL queries
- GitHub - project hosting


Files
- 'prague_airbnb_analysis.sql' - SQL queries for all four questions
- '*csv' - query results


