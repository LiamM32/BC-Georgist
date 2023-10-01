# Land Value Tax Distribution Framework

This page describes a system to distibute revenue from a land value tax on all private property in British Columbia to municipal governments, regional districts, and the provincial government. This system results in municipalities with more land value per-capita owing a larger percentage of the revenue they raise. It also results in municipalities with more burdensome zoning owing a larger percentage.

In this system, the government of British Columbia will impose a land value tax on all private property in British Columbia as a percentage of ground rent. This requires BC Assessment to begin assessing land values in terms of ground rent.

This system of revenue distribution also requires BC Assessment to make a zoning-independent estimation of land value. This second value does not determine how much private property owners owe in tax, but is part of the formula in determining how much each municipality owes.

In this system, land value tax is collected by municipalities. Municipalities give a portion of this revenue to the regional district according to a formula. Revenue from properties in unincorporated areas will go directly to the regional district. Regional districts will pay a portion of their revenue to the provincial government according to a similar formula. This process doesn’t need to happen literally. Instead, the process can be simulated to determine how much money to allocate to each entity. The formulae are designed so that no entity will owe more money than they raise.

## The municipal formula:
Here is the formula for how much money a municipality owes to the regional district:
$$\displaystyle{R_{oM}} = \frac{p R_t R_n + R_t R_n^2}{2R_n^2+(\frac{R_n}{R_t}+2c_M)p r_{mP} R_t}$$

Here is a description of each variable:

$R_t$ is the total revenue that the municipality is required to raise by provincial legislation. Unless if the municipality has chosen to have a land value tax at a higher rate than provincially required, this will simply be the total revenue raised from land value tax on all private property in the municipality.

$R_n$ is a zoning-independent measure of municipal land value. It may be implemented as an estimate of how high the $R_t$-value would be under an optimal land use policy. This will usually be higher than $R_t$, with more burdensome zoning causing a bigger difference. Ideally this should include all land under the control of the municipality, excluding conservation land. 

$p$ is the population of the municipality.

${r_{mP}}$ is the provincial land value tax revenue per-person. The same value will be used for every municipality.

$c_M$ is a value set depending on what share of revenue is desired to be allocated to municipalities. A lower c-value results in the municipality owing more, and keeping less. The province will set a default c-value, but individual regional districts can set it lower if they want more revenue. It should never be set higher than $c_R$ (which will be described later). There will be more information on c-values at the end.

## The regional district formula:
Before determining how much a regional district owes to the province, it is recommended to calculate the value of $R_iR$. This uses the same formula as $R_{oM}$, but with the $p$, $R_t$, and $R_n$ values including the entire regional district.
$$\displaystyle{R_iR} = \frac{p R_t R_n + R_t R_n^2}{R_n^2 + p R_n +2c_M p r_{mP} R_t}$$

All uses of $p$, $R_t$, and $R_n$ in this section include the population and land in the entire regional district, excluding conservation land. It should only include land under the control of the regional district or a member municipality.

Regional districts may use one of two formulae to determine how much money they owe to the province, generally whichever has a lower value. Here is the first option:
$$\displaystyle{R_{oRa}} = \frac{p R_iR R_n + R_iR R_t R_n}{R_t R_n + p R_n + 2c_M p r_{mP} R_iR}$$

This formula can’t be manipulated by the location of borders between municipalities. But it is mathematically possible for it to exceed the revenue that a regional district has raised. They may alternatively use the following formula to reduce what they owe.
$$\displaystyle{R_{oRb}} = \frac{p (\sum{R_{oM}}) R_n + (\sum{R_{oM}}) R_t R_n}{R_t R_n + p R_n + 2c_M p r_{mP} (\sum{R_{oM}})}$$

This latter formula will never result in the regional district owing more money than they have collected. Both of these formulae result in regional districts receiving a larger percentage of collected revenue when their member municipalities have more burdensome zoning.

$\sum{R_{oM}}$ is the sum of all land value tax revenue the regional district receives from member municipalities, plus the $R_{oM}$ value for unincorporated areas. All unincorporated areas in a given regional district should be treated as if they constituted a single municipality.

$c_R$ is like $c_M$, but for regional districts. It must be set to the same value for all regional districts in the province. It should never be less than $c_M$. A value of 1 results in roughly half of the total land value tax revenue going to the province.

### Simpler alternative formula:
If $R_{oRa}$ and $R_{oRb}$ are deemed too complicated, the following formula may alternatively be used in their place. However, this one is technically inferior, as it’s more sensitive to the location of borders between municipalities.
$$\displaystyle{R_{oRb}} = \frac{p (\sum{R_{oM}}) R_n + (\sum{R_{oM}}) R_t R_n}{R_t R_n + p R_n + 2c_M p r_{mP} (\sum{R_{oM}})}$$

## Guide to c-values:
Here is a guide to setting the values of $c_M$ and $c_R$. Municipalites should be given a larger share of revenue than under current government budgets, as land value tax reduces the disadvantages of financial decentralisation. Regional districts should be given the smallest share of the revenue.

The following table assumes that each municipality and regional district has equal land value per-capita and that $R_n = R_t$. In reality, the province gets a slightly larger share when there’s more difference in land value per-capita. The share kept by municipalities gets smaller with less efficient land use.

| $c_M$ value: | $c_R$ value: | Municipal share: | RD share: | Provincial share: |
| ------------ | ------------ | ---------------- | ---------------- | ---------------- |
| 2/3 | 1 | 40% | 10% | 50% |
| 20/11 | 1 | 45% | 5% | 50% |
| 3/5 | 2/3 | 37.5% | 2.5% | 60% |
| 12/13 | 13/12 | 48% | 4% | 48% |

If you want a given percentage to go to municipalities, use the following formula to determine $c_M$, with $P_M$ being the target percentage:
$$\displaystyle c_M = \frac{P_M}{1-P_M}$$

The following formula can then be used to determine $c_R$, with $P_R$ being the target percentage for regional districts:
$$\displaystyle c_R = \frac{P_M+P_R}{1-P_M-P_R}$$
