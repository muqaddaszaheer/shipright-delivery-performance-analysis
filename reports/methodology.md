# Methodology

The analysis follows the Google Data Analytics six-phase framework: Ask, Prepare, Process, Analyze, Share, and Act. The raw Olist dataset files are kept unchanged, while processed analysis outputs are created using documented preparation and transformation rules.

The core delivery analysis focuses on delivered orders. Delivery delay is calculated as the difference between the actual delivery date and the estimated delivery date. A negative delay means the order was delivered before the estimated date. Because average delay can be negative even when some orders are late, the late-delivery rate is used as the primary operational KPI.

For review analysis, multiple review records for the same order are aggregated into a mean review score. For seller analysis, unique order-seller pairs are used because an order can contain multiple sellers and multiple item rows. For category analysis, unique order-category pairs are used to reduce repeated-item weighting.

These methods are designed to reduce duplicate counting and ensure that the analysis reflects the structure of the underlying data.
