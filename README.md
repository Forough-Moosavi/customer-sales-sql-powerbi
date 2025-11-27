# 📘 Customer Churn Analysis – SQL + Python (ML) + Power BI  
An end-to-end analytics project identifying churn-prone customers, predicting churn probability using Machine Learning, segmenting customers by risk, and visualizing insights for business decision-making.

---

# 🧩 1. Business Problem  
A telecom company wants to:

- Identify customers likely to churn  
- Understand churn patterns across segments  
- Build a dashboard for management  
- Generate actionable insights (contract type, risk levels, revenue impact)

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
All SQL scripts are located in the **/sql** directory.

### Example: Creating a feature view for ML

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

---

# 🧼 4. Python – Data Cleaning & ML Pipeline  

### **Cleaning Steps**
- Removed missing values  
- Converted TotalCharges & MonthlyCharges → float  
- Standardized ChurnFlag to binary (0/1)  
- Removed outliers  
- One‑hot encoded categorical variables  
- Scaled numerical features  
- Applied stratified train-test split  

### **Machine Learning**
- **Logistic Regression** used for prediction  
- Outputs:  
  - **Churn Probability**  
  - **Risk Segments**: Low, Medium, High  

Output stored in:  
`data/churn_scores.csv`

---

# 📊 5. Power BI Dashboard  

File: `powerbi/Customer Churn Analysis.pbix`

Dashboard includes:

- KPI Cards  
- Churn by Contract Type  
- Risk Segment Distribution  
- Slicers  
- Customer-level probability table  

### **Dashboard Preview**
![Dashboard](dashboard.png)

---

# 🔥 6. Business Insights (Executive Summary)

### **1) Month‑to‑Month Customers Have the Highest Churn**
- **Churn Rate = 31.8%**  
These customers cancel early.  
**Recommendation:** Offer retention incentives & loyalty programs.

---

### **2) Long‑Term Contracts Reduce Churn Significantly**
- **Two‑year contract churn ≈ 11% (lowest)**  
- **One‑year contract churn ≈ 15%**

➡ **Correct order:**  
**Two‑year < One‑year < Month‑to‑Month**

---

### **3) Customer Tenure Is a Key Predictor**
New customers churn far more frequently.  
**Recommendation:** Improve onboarding & early engagement.

---

### **4) Most Customers Are Medium Risk (0.30–0.60)**  
Ideal target for proactive retention strategies.

---

### **5) No Customers Classified as High Risk**  
Model predictions are stable; dataset contains fewer extreme churn cases.

---

# ▶️ 7. How to Run

### **SQL**
Use DB Browser for SQLite → load `churn.db`

### **Python**
Run `churn.ipynb` in Google Colab or VS Code

### **Power BI**
Open `Customer Churn Analysis.pbix` (inside /powerbi)

---

# 🙌 8. Final Notes  

This project demonstrates:

- SQL Querying  
- End‑to‑End Machine Learning Workflow  
- Real‑World Data Cleaning  
- Feature Engineering  
- Churn Probability Modeling  
- Power BI Dashboard Development  
- Professional GitHub Structuring  

Perfect for **Data Analyst, BI Analyst, and Junior Data Scientist** roles.

---

# 👩‍💻 About Me  

**Forough S. Moosavi**  
**Data Analyst | SQL | Power BI | Excel | Python**

Experienced in building end‑to‑end analytics projects: from data cleaning to dashboards.  
Focused on business‑driven insights, not just charts.  
Open to Data Analyst / BI roles and freelance opportunities.

📧 **Email:** forooghmousavi1371@gmail.com  
🔗 **GitHub:** https://github.com/Forough-Moosavi  
