# 📘 Customer Churn Analysis – SQL + Python (ML) + Power BI  
An end-to-end analytics project that identifies churn-prone customers, predicts churn probability using Machine Learning, segments customers by risk, and visualizes actionable insights for business decision-making.

---

# 👩‍💻 About Me  
**Forough S. Moosavi**  
**Data Analyst | SQL | Power BI | Excel | Python**

Experienced in building end-to-end analytics projects: from data cleaning to dashboards.  
Focused on business-oriented insights, not just charts.  
Open to Data Analyst / BI roles and freelance opportunities.

📧 **Email:** forooghmousavi1371@gmail.com  
🔗 **GitHub:** https://github.com/Forough-Moosavi  

---

# 🧩 1. Business Problem  
A telecom company wants to:

- Identify which customers are likely to churn  
- Understand churn behavior across segments  
- Build a dashboard for management  
- Get actionable insights (e.g., contract type, risk level, revenue patterns)

This project delivers the **full pipeline** from raw data → SQL → ML → Power BI.

---

# 📁 2. Project Structure  

```
📦 customer-churn-analysis
│
├── 📁 data
│   ├── churn.db
│   ├── churn_customers_raw.csv
│   └── churn_scores.csv
│
├── 📁 sql
│   ├── VIEW_customer_features.sql
│   ├── Total_customers.sql
│   ├── Rate_customers_churn.sql
│   ├── Churn Rate by ContractType.sql
│   ├── Churn Rate by PaymentMethod.sql
│   └── churn_customers.sql
│
├── 📁 powerbi
│   └── Customer Churn Analysis.pbix
│
├── churn.ipynb
├── churn.ipynb - Colab.pdf
├── dashboard.png
└── README.md
```

---

# 🗄️ 3. SQL – Data Preparation  
All SQL scripts are in the **/sql** folder.

Example: **Create View for ML model**

```sql
CREATE VIEW customer_features AS
SELECT
    CustomerID,
    Gender,
    Age,
    TenureMonths,
    PaymentMethod,
    ContractType,
    MonthlyCharges,
    TotalCharges,
    ChurnFlag
FROM customers;
```

SQL tasks completed:

- Extract data from database  
- Create analytical views  
- Compute churn rates  
- Group churn by contract type, payment method  
- Prepare customer feature table for ML  

---

# 🧼 4. Python – Data Cleaning & ML Pipeline  

### **Cleaning steps:**
- Removed missing values  
- Converted TotalCharges & MonthlyCharges → float  
- Standardized ChurnFlag to (0/1)  
- Removed outliers  
- One-hot encoded categorical variables  
- Scaled numeric features  
- Train/test split (stratified)  

### **Machine Learning**
- Model: **Logistic Regression**  
- Predicts **Churn Probability**  
- Creates **Risk Segments**:
  - Low Risk  
  - Medium Risk  
  - High Risk  

Output saved to:  
`data/churn_scores.csv`

---

# 📊 5. Power BI Dashboard  
File: `powerbi/Customer Churn Analysis.pbix`

Dashboard includes:

- KPI Cards  
- Churn Rate by Contract Type  
- Customer Risk Distribution  
- Interactive Slicers  
- Customer table with charges & churn probability  

### **Dashboard Preview**
![Dashboard](dashboard.png)

---

# 🔥 6. Business Insights (Executive Summary)

### **1) Month-to-Month Customers Have the Highest Churn Risk**
- **Churn Rate = 31.8%**  
These customers cancel early and often.  
**Recommendation:** Offer retention incentives & loyalty programs.

---

### **2) Long-Term Contracts Strongly Reduce Churn**
- **Two-year contract churn ≈ 11% (Lowest)**
- **One-year contract churn ≈ 15%**

➡ **Correct order:**  
**Two-year < One-year < Month-to-Month**

---

### **3) Customer Tenure Is a Strong Churn Predictor**
New customers churn far more frequently.  
**Recommendation:** Focus on onboarding & early engagement.

---

### **4) Most Customers Are Medium Risk (0.30–0.60)**  
Ideal group for proactive retention strategies.

---

### **5) No Customers Classified as High Risk**  
Model produced stable churn probabilities.

---

# ▶️ 7. How to Run

### **SQL**
Use DB Browser for SQLite → load `churn.db`

### **Python**
Run `churn.ipynb` in Google Colab or VS Code

### **Power BI**
Open `Customer Churn Analysis.pbix` (inside /powerbi)

---

# 🙌 Final Notes  
This project demonstrates:

- SQL Querying  
- Machine Learning Workflow  
- Real-World Data Cleaning  
- Feature Engineering  
- Churn Probability Modeling  
- Power BI Dashboard Design  
- Professional GitHub Structure  

Perfect for **Data Analyst, BI Analyst, and Junior Data Scientist** roles.

