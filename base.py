import pandas as pd


countries = pd.read_csv('./data/HNP_StatsCountry.csv')
countrySeries = pd.read_csv('./data/HNP_StatsCountry-Series.csv')
data = pd.read_csv('./data/HNP_StatsData.csv')
footNote = pd.read_csv('./data/HNP_StatsFootNote.csv')
seriesTime = pd.read_csv('./data/HNP_StatsSeries-Time.csv')
series = pd.read_csv('./data/HNP_StatsSeries.csv')

fullData = [
  countries,
  countrySeries,
  data,
  footNote,
  seriesTime,
  series
]

for frame in fullData:
  print('----------------')
  for col in frame.columns:
    print(col)
print('----------------')