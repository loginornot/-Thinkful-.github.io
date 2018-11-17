import pickle
import pandas as pd

df = pd.read_csv("liquor_dataframe.csv")

output_pkl_file = open('liquor_dataframe.pkl', 'wb')
pickle.dump(df, output_pkl_file, protocol=-1)
output_pkl_file.close()

# output_pkl_file is a filehandle name
with open('liquor_dataframe.pkl','wb') as output_pkl_file:
    pickle.dump(df, output_pkl_file, protocol=-1)

# input_pkl_file is a filehandle name
with open('liquor_dataframe.pkl','rb') as input_pkl_file:
    df = pickle.load(input_pkl_file)

# append data to dataframe
df2_pickle['lowercase_city'] = df2_pickle['City'].map(lower)

df2_pickle.columns
# ['City', 'lowercase_city', …]
