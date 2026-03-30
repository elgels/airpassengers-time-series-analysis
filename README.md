<h1>AirPassengers Time Series Analysis and Forecasting</h1>

<h2>Project Overview</h2>
<p>
This project analyzes the classic <strong>AirPassengers</strong> dataset using time series techniques in <strong>R</strong>. The goal is to model and forecast monthly totals of international airline passengers using <strong>SARIMA</strong> models.
</p>

<p align="center">
  <img src="figures/time_series_plot.png" alt="Monthly international airline passengers showing trend and seasonality" width="700">
</p>
<p align="center">
  <em>Figure: Monthly international airline passengers showing strong trend and seasonality.</em>
</p>

<h2>Dataset</h2>
<p>
The dataset used is the classic <strong>AirPassengers</strong> dataset, which contains monthly totals of international airline passengers from <strong>1949 to 1960</strong>.
</p>

<h2>Methods</h2>
<p>The analysis includes the following steps:</p>
<ul>
  <li>Time series visualization</li>
  <li>Log transformation to stabilize variance</li>
  <li>Seasonal differencing to achieve stationarity</li>
  <li>ACF and PACF analysis</li>
  <li>SARIMA model identification and selection</li>
  <li>Model diagnostics (ACF, Q-Q plot, Ljung–Box test)</li>
  <li>Forecast generation</li>
</ul>

<h2>Results</h2>
<p>
A SARIMA model was selected based on <strong>AIC</strong> and diagnostic checks. The model captures both trend and seasonal patterns effectively, with residual diagnostics supporting an adequate fit. The final model provides short-term forecasts with prediction intervals for future passenger totals.
</p>

<p align="center">
  <img src="figures/forecast_plot.png" alt="SARIMA forecast for AirPassengers with prediction intervals" width="700">
</p>
<p align="center">
  <em>Figure: SARIMA model forecast with prediction intervals.</em>
</p>

<h2>Reports</h2>
<ul>
  <li><strong>Reproducible analysis (R Markdown output):</strong> <code>reports/airpassengers_analysis.pdf</code></li>
  <li><strong>Final forecasting report:</strong> <code>reports/airpassengers_forecast_report.pdf</code></li>
</ul>
<p>
The full reproducible analysis and the final report are available in the <code>reports/</code> folder.
</p>

<h2>Repository Structure</h2>
<pre><code>airpassengers-time-series-analysis/
├── data/
│   └── airpassengers.csv
├── figures/
│   ├── time_series_plot.png
│   └── forecast_plot.png
├── reports/
│   ├── airpassengers_analysis.Rmd
│   ├── airpassengers_analysis.pdf
│   └── airpassengers_forecast_report.pdf
├── scripts/
│   └── airpassengers_analysis.R
├── .gitignore
├── LICENSE
└── README.md
</code></pre>

<h2>Technologies</h2>
<p>
R • forecast • atsa • fUnitRoots • R Markdown
</p>

<h2>Key Skills Demonstrated</h2>
<p>
Time Series Analysis • SARIMA Modeling • Forecasting • Statistical Diagnostics • R Programming
</p>
