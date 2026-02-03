# #3.a) Using a matrix inversion (such as shown above or Machine Learning Refined
# # (MLR) p. 108 eqn 5.17) find the weights and intercept to predict F from the
# # other columns. Determine the residual squared, or R2
# # . Use compact
# # notation as described in the lecture so that you get an intercept b (or w0).
# # You can read the file in using pandas and create A in compact notation
# # using this code:

import numpy as np
import pandas as pd
df = pd.read_csv('regressionprob1_train0.csv')
X = df.iloc[:,0:4].values
y = df['F'].values
ones_ = np.ones(len(y),float)
## compact notation
A = np.column_stack((ones_,X))

# This Python code will calculate R2
##
## unexplained variance squared
## or R squared
## Y is the target value
## Yp is the predicted value
##
import numpy as np
def Rsquared(Y,Yp):
    V = Y-Yp
    Ymean = np.average(Y)
    totvar = np.sum((Y-Ymean)**2)
    unexpvar = np.sum(np.abs(V**2))
    R2 = 1-unexpvar/totvar
    return(R2)

# you can alternately use

# from sklearn.metrics import r2_score
# R2 = r2_score(y,Yp)

w = np.linalg.inv(A.T @ A) @ (A.T @ y)

Yp = A @ w

R2 = Rsquared(y, Yp)

print("w =", w)
print("residual squared", R2)

# w = [ 0.07249081  2.04773925  3.16044263 -5.09550919 10.20993353]
# residual squared 0.9969209428506091

# #####################################


w_lin = np.linalg.solve((A.T @ A ), (A.T @ y))

Yp_lin = A @ w_lin
R2_lin = Rsquared(y, Yp_lin)

print("w =", w_lin)
print("residual squared=", R2_lin)

# OUtput:
# w = [ 0.07249081  2.04773925  3.16044263 -5.09550919 10.20993353]
# residual squared= 0.9969209428506091

# # Now use the model trained in a) to do prediction on dataset
# # regressionprob1_test0.csv. The column labeled F is the target. Compare
# # these predictions to actual target labels by determining the residual
# # squared, or R2
# # . What can you conclude about your trained model from a)
# # and from b)?

df_test = pd.read_csv("regressionprob1_test0.csv")

x_test = df_test.iloc[:, 0:4].values
y_test = df_test["F"].values

A_test = np.hstack([np.ones((len(y_test), 1)), x_test])

Yp_test = A_test @ w  # use weights from 3(a)

R2_test = Rsquared(y_test, Yp_test)

print("\n=== Part 3(c): Test evaluation (using 3a weights) ===")
print("Test R2 =", R2_test)


# # Now use the model trained in a) to do prediction on dataset
# # regressionprob1_test0.csv. The column labeled F is the target. Compare
# # these predictions to actual target labels by determining the residual
# # squared, or R2
# # . What can you conclude about your trained model from a)
# # and from b)?
# # Now write your own Gradient descents code and code the gradient to find the
# # weights to minimize the cost function in (3) using training data
# # regressionprob1_train0.csv. Solve for the weights and intercept using this using this
# # training dataset. Compare this solution with your solution from (4). Be sure to
# # use compact notation.

def gradient_descent(A, y, lr=1e-3, iters=20000, tol=1e-10, verbose_every=2000):
    m, n = A.shape
    w = np.zeros(n)

    prev_cost = None
    for i in range(iters):
        pred = A @ w
        err = pred - y
        cost = (err @ err) / (2*m)

        grad = (A.T @ err) / m
        w = w - lr * grad

        if verbose_every and (i % verbose_every == 0):
            print(f"iter={i:6d} cost={cost:.6e}")

        if prev_cost is not None and abs(prev_cost - cost) < tol:
            # converged
            break
        prev_cost = cost

    return w

w_gd = gradient_descent(A, y, lr=1e-3, iters=200000, verbose_every=5000)
Yp_gd = A @ w_gd
R2_gd = Rsquared(y, Yp_gd)

print("\n4: Gradient Descent #####")
print("w_gd (b, w1..w4) =", w_gd)
print("Train R2 (GD)    =", R2_gd)

print("\nMax abs diff gradient descent vs linear:", np.max(np.abs(w_gd - w_lin)))


# # Use a canned linear regression similar to
# # sklearn.linear_model.LinearRegression and extract the weights for the training
# # dataset. Apply this model to the training dataset. Calculate and compare your
# # resulting R2 and model weights to those in (4), and (5). You can use compact
# # notation, or you can tell your regression to extract an intercept.
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
# df = pd.read_csv('regressionprob1_train0.csv')
from sklearn.linear_model import LinearRegression

lin = LinearRegression(fit_intercept=True)
lin.fit(X, y)

print("\n5: sklearn LinearRegression ===")
print("intercept b =", lin.intercept_)
print("weights w   =", lin.coef_)

Yp_lin = lin.predict(X)
print("Train R2    =", Rsquared(y, Yp_lin))





# # Now use the linear regression, Lasso, Ridge, and Elastic net
# # Use the dataset randPolyN2.csv The column labeled Z is the target.

# df = pd.read_csv('randPolyN2.csv')
# from sklearn import LinearRegression

# from sklearn import linear_model
# clf = linear_model.Lasso(alpha=0.1)
# model = clf.fit(X_train_std, Y_train)
# from sklearn.linear_model import Ridge
# clf = Ridge(alpha=0.1)
# model = clf.fit(X_train_std, Y_train)
# from sklearn.linear_model import ElasticNet
# clf = ElasticNet(alpha=0.1)
# model = clf.fit(X_train_std, Y_train)
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression, Lasso, Ridge, ElasticNet

dfp = pd.read_csv("randPolyN2.csv")

# Assume Z is target, all other columns are features
X = dfp.drop(columns=["Z"]).values
y = dfp["Z"].values

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.25, random_state=42
)

scaler = StandardScaler()
X_train_std = scaler.fit_transform(X_train)
X_test_std  = scaler.transform(X_test)

models = {
    "LinearRegression": LinearRegression(),
    "Lasso(alpha=0.1)": Lasso(alpha=0.1, max_iter=20000),
    "Ridge(alpha=0.1)": Ridge(alpha=0.1),
    "ElasticNet(alpha=0.1)": ElasticNet(alpha=0.1, max_iter=20000),
}

results = {}

for name, model in models.items():
    model.fit(X_train_std, y_train)
    yp_train = model.predict(X_train_std)
    yp_test  = model.predict(X_test_std)

    results[name] = {
        "train_r2": Rsquared(y_train, yp_train),
        "test_r2":  Rsquared(y_test, yp_test),
        "model": model,
        "yp_test": yp_test
    }

print("\n6: Regularized models on randPolyN2.csv")
for name, r in results.items():
    print(f"{name:20s}  train R2={r['train_r2']:.4f}  test R2={r['test_r2']:.4f}")



