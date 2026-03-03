Аналіз ринку Airbnb у Празі

Цей проєкт містить аналіз даних Airbnb у Празі на основі відкритих даних [Inside Airbnb](https://insideairbnb.com/get-the-data/) (вересень 2025).

Аналіз виконано з використанням PostgreSQL / DBeaver, попереднє очищення даних - у Python (pandas). Дані відображають прогнозований, а не фактичний дохід.

Дата: Березень 2026  

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
де 'availability_365` - кількість днів у наступні 365, коли квартира доступна.

Аналіз
- Питання 1: Аналіз доходів по районах Праги
- Питання 2: Професіонали (5+ квартир) vs аматори (1 квартира)
- Питання 3: Інвестиційна привабливість районів
- Питання 4: Вплив мінімальної кількості ночей (minimum_nights) на дохід

Висновки

1. Дохід по районах
- Найвищий дохід:Praha 18 ($20,471) - аномалія, мало оголошень (11)
- Центр: Praha 1 ($17,864), Praha 2 ($17,299), Praha 13 ($17,467)
- Найкраще співвідношення: Praha 3 ($14,263) - низька ціна ($78), висока зайнятість (191 день)
- Найнижчий дохід: Praha 15 ($6,520), Velká Chuchle ($7,993)

2. Професіонали vs Аматори
Професіонали домінують на ринку (73% оголошень), беруть вищу ціну (+17%), але мають нижчу зайнятість. Підсумковий дохід лише на 5.5% вищий, ніж у аматорів.

3. Інвестиційна привабливість
Найкраще співвідношення ціни та зайнятості:
- Praha 2 - оптимальний баланс ціни та зайнятості
- Praha 3 - низька ціна, висока зайнятість
- Praha 10 - хороший потенціал

4. Вплив minimum_nights
Найвигідніше встановлювати мінімум 3-4 ночі ($17,070/рік). Стратегія "1 ніч" дає найнижчий дохід ($14,520/рік) через низьку зайнятість.

Файли
- 'prague_airbnb_analysis.sql'- SQL запити для всіх чотирьох питань
- '*.csv`- результати виконання запитів

---------------------------------------------------------------------------------------------------------------------------------------------
Airbnb Prague Market Analysis

This project contains an analysis of Airbnb listings in Prague based on open data from [Inside Airbnb](https://insideairbnb.com/get-the-data/) (September 2025).

The analysis was performed using PostgreSQL / DBeaver, with preliminary data cleaning in Python (pandas). The data reflects predicted, not actual, income.

Date: March 2026

Methodology

1. Data
- Data downloaded from Inside Airbnb (September 2025 snapshot)
- Data cleaning performed in Python:
  - Removed price outliers (kept listings under $231)
  - Removed districts with <5 listings
  - Removed erroneous records (minimum_nights > 365)
- Final dataset: 7,453 listings

2. Calculations
Predicted annual income is calculated using the formula:
income = price_usd × (365 - availability_365)
where 'availability_365' is the number of days in the next 365 that the listing is available.

Analysis
- Question 1: Income analysis by district in Prague
- Question 2: Professionals (5+ listings) vs amateurs (1 listing)
- Question 3: Investment attractiveness by district
- Question 4: Impact of minimum nights on income

Conclusions

1. Income by District
- Highest income: Praha 18 ($20,471) - anomaly, few listings (11)
- City center: Praha 1 ($17,864), Praha 2 ($17,299), Praha 13 ($17,467)
- Best value: Praha 3 ($14,263) - low price ($78), high occupancy (191 days)
- Lowest income: Praha 15 ($6,520), Velká Chuchle ($7,993)

2. Professionals vs Amateurs
Professionals dominate the market (73% of listings), charge higher prices (+17%), but have lower occupancy. Final income is only 5.5% higher than amateurs.

3. Investment Attractiveness
Best price-occupancy ratio:
- Praha 2 - optimal balance of price and occupancy
- Praha 3 - low price, high occupancy
- Praha 10 - good potential

4. Impact of Minimum Nights
The most profitable minimum stay is 3-4 nights ($17,070/year). The "1 night" strategy yields the lowest income ($14,520/year) due to low occupancy.

Files
- 'prague_airbnb_analysis.sql' - SQL queries for all four questions
- '*.csv' - query results


