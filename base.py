import pandas as pd


countries = pd.read_csv('./data/HNP_StatsCountry.csv')
countrySeries = pd.read_csv('./data/HNP_StatsCountry-Series.csv')
data = pd.read_csv('./data/HNP_StatsData.csv')
footNote = pd.read_csv('./data/HNP_StatsFootNote.csv')
seriesTime = pd.read_csv('./data/HNP_StatsSeries-Time.csv')
series = pd.read_csv('./data/HNP_StatsSeries.csv')
catastrophes = pd.read_csv('./data/emdat_public_2022_01_31.csv')
electoralViolence = pd.read_csv('./data/ucdp-prio-acd-211.csv')

fullData = [
  countries,
  countrySeries,
  data,
  footNote,
  seriesTime,
  series,
  catastrophes
]

def getAllColumns():
  for frame in fullData:
    print('----------------')
    for col in frame.columns:
      print(col)
  print('----------------')
  
def getTopics():
  column_values = series[["Topic"]].values.ravel()
  unique_values =  pd.unique(column_values)
  print(unique_values)

def getIndicators(topics):
  healthStats = series.loc[series['Topic'].isin(topics)]
  column_values = healthStats[["Indicator Name"]].values.ravel()
  unique_values =  pd.unique(column_values)
  print(unique_values)



#getTopics()

healthIndicatorTopics = ['Non-communicable diseases', 'Nutrition', 'HIV/AIDS', 'Reproductive health', 'Water and sanitation', 'Immunization', 'Medical resources and usage' 'Infectious diseases' 'Health financing', 'Background: Poverty']

#getIndicators(healthIndicatorTopics)

for col in electoralViolence.columns:
   print(col)


