# DataAnalytics-Assessment
Cowrywise DataAnalytics-Assessment

## Question 1. Finding High-Value Customers with Multiple Products

### Approach Used : 
                I Identified customers having both savings (for that i used check [type 1 or 4]) and investment accounts, Summarized their deposits across
all accounts.
### Challenge:
               The main challange was ,without the users table i cant fetch customer names or verify exisiting identities. Some accounts show zero balances,
making it ambigous to analyze if they're actually being used.
### Solution implemented : 
                I focused only on accounts having money in them (for that i used check [amount > 0] ) and structured the query making it easily add 
customer names later on when data is retrived.

## Question 2. Transaction Frequency Analysis

### Approach Used: 
                I grouped customers by activity level using account creation dates since real transaction data isn't available.
### Challenge: 
                Without actual transaction records, we're just guessing at how often customers really use their accounts. Some active customers might show as inactive if they haven't opened new accounts recently.
### Solution implemented : 
                I clearly labeled these as estimates and categorically built the query so we can plug in real transaction data when we get it.

## Question 3. Spotting Dormant Accounts

### Approach Used: 
                I flagged Such accounts with no charges or activity for over a period of a year using the last recorded action date.
### Challenge: 
                Some accounts might be active but not showing charges ,, maybe they're just holding money without transactions. We also can't see logins or other activity types.
### Solution implemented : 
                I used the most recent of either last charge date or account creation date to be safe, and noted these might need manual review.

## Question 4. Estimating Customer Value

### Approach Used: 
                I calculated the potential value based on facts such as account age and balances, assuming small profits on transactions.
### Challenge: 
                Real profits may vary by product and we don't know actual transaction amounts or frequencies. New customers might show odd values because
they haven't been with us long.
### Solution implemented : 
                I used conservative estimates and excluded brand new accounts from the calculations. Then i added clear notes that these are rough projections, not exact numbers.
