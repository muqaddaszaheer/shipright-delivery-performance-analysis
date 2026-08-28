# Methodology

The analysis follows the Google Data Analytics six-phase framework. The raw Olist files are kept unchanged. Processed outputs are generated from the raw files with documented rules.

The core delivery KPI uses delivered orders only. A negative delay means the order arrived before the estimated date. Because an average delay can be negative even when some orders are late, the late-delivery rate is the primary operational KPI.

For review analysis, multiple review records for one order are reduced to the mean review score. For seller analysis, unique order-seller pairs are used because an order can contain multiple sellers and multiple item rows. For category analysis, unique order-category pairs are used to reduce repeated-item weighting.
