import numpy as np
import pandas as pd

nrows = 10000

groups = np.random.poisson(lam=2, size=nrows)
sizes = np.random.poisson(lam=10, size=nrows)
variation = np.random.uniform(low=5, high=100, size=nrows)
data = np.random.normal(loc=2.5, scale=1.0, size=nrows)

df = pd.DataFrame(
    dict(
        groups=groups,
        sizes=sizes,
        variation=variation,
        data=data,
    )
)

df_with_index = df.set_index(['groups','sizes'])
