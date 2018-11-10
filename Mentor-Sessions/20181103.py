list_of_strings = [
    '\n',
    'biologicial'
    'behavioural'
    'trials'
    'and'
]
list_of_replacements = [
    '',
    'biological'
    'behavioral'
    'trials'
    '&'
]

## the zip function for two lists
z = zip(list_of_strings, list_of_replacements)
print(next(z))
# will output ('\n', '')

def replace_all_hardcoded(df, strings, replacements):
    replaced_df = df
    for (string, replacement) in zip(strings, replacements):
        replaced_df.loc[:, 'JournalTitle'] = replaced_df.loc[:, 'JournalTitle'].str.replace(string, replacement)

    return replaced_df

# including column_name as an argument makes the function more general
def replace_all(df, column_name, strings, replacements):
    replaced_df = df
    for (string, replacement) in zip(strings, replacements):
        replaced_df.loc[:, column_name] = replaced_df.loc[:, column_name].str.replace(string, replacement)

    return replaced_df


df.loc[:, 'JournalTitle'] = df.loc[:, 'JournalTitle'].str.lower()
pd.__version__
# '0.20.3'
