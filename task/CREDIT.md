# Decentralized Credit Scoring System

### Problem Statement

In emerging markets like developing regions, millions of individuals remain unbanked or underbanked, largely excluded from access to formal credit due to the absence of 
traditional financial histories. Conventional credit scoring systems depend on centralized institutions and documented financial behavior, which are often unavailable 
in these regions. This exclusion limits opportunities for personal and economic growth. 

With the growth of mobile money and decentralized finance (DeFi), there is a critical opportunity to bridge this gap. However, DeFi platforms lack reliable, 
decentralized mechanisms to assess credit risk without traditional credit scores. This creates a challenge in offering credit safely and equitably.

The goal is to build a decentralized, privacy-preserving credit scoring system that uses alternative data sources—such as mobile money transactions, blockchain activity,
and utility payments—to assess creditworthiness. Such a system would empower DeFi platforms to extend fair, transparent credit to underserved populations, fostering 
greater financial inclusion and economic resilience.

### Objective

Frame this business need into a data science problem:
Develop a credit scoring model using blockchain data, enriched with anomaly detection techniques, to Develop a decentralized credit scoring model using blockchain data 
and anomaly detection techniques to assess user creditworthiness without traditional credit reports. The model should leverage on-chain data, ensuring privacy,
transparency, and scalability while providing a non-custodial solution for evaluating creditworthiness within the decentralized finance ecosystem.

### Data Required

To build the credit scoring model, the following data features will be collected and analyzed:

  - **Account Activity**: This metric measures how active a user is by calculating the number of transactions made relative to the account's lifespan. A fixed start and end date will be used to ensure consistent analysis of account activity within defined timeframes.

  - **Health Factor**: A numerical value representing the safety of deposited assets, calculated as the ratio of collateral deposited to the amount borrowed. A Health Factor close to 1 is ideal to avoid liquidation risks.

  - **Loan to Value (LTV)**: This ratio indicates the loan amount in comparison to the value of the collateral. Higher LTV ratios signify higher risk in lending assessments.

  - **Current Liquidity Threshold**: This percentage indicates the liquidity level beyond which the user risks liquidation. Higher thresholds mean the user is closer to potential liquidation.

  - **Total Collateral**: The total amount of collateral the user has deposited. Higher collateral suggests greater safety for the lender.

  - **Available Borrows**: The borrowing capacity left for the user. It represents how much the user can borrow based on available collateral.

  - **Credit Mix (Diversification)**: This feature measures how diversified the user's credit portfolio is. A diverse mix indicates a better ability to manage different types of credit and reduce risk.

  - **Repayment Rate**: This calculates the percentage of the loan that has been repaid. Higher repayment rates indicate a responsible borrower.





