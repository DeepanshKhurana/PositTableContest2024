# PositTableContest2024
When I made the Hrafnagud project I recently talked about at ShinyConf (and am about to talk about at useR! in July and EARL in September), I also made several apps for myself to consume each API. The app and API for tracking my finances is called Ebenezer, named after the miserly Scrooge. My goal was to take each kind of financial instrument and make a table that fits well for it. Bonds work differently than Equity stocks, for example, and therefore, should be represented differently. The result was the following tables, which are now a part and parcel of my application.

The [Quarto document](https://deepanshkhurana.quarto.pub/ebenezer-tables/) walks you through the four key styles of tables: ticker, stocks, bonds, and funds (with two sub-types). All the tables are built in `reactable`, customised with css styling. The code is already present. All tables are mobile-friendly.

Previews of the tables are present below.

## Ticker

Key-features: search (can be lengthy), easy semantic colouring.

<img src="https://github.com/DeepanshKhurana/PositTableContest2024/assets/26517718/0e58d24f-177c-499e-9938-98b68dd160d0" width="500">

## Stocks

Key-features: search (can be lengthy), easy semantic colouring, easy to read layout, hover over icon for label

<img src="https://github.com/DeepanshKhurana/PositTableContest2024/assets/26517718/5e45a3af-ad71-4fb0-a7be-1f7af087a808" width="500">

## Bonds

Key-features: progress bars, easy to read layout, hover over icon for label

<img src="https://github.com/DeepanshKhurana/PositTableContest2024/assets/26517718/7009cf76-7f41-4604-885d-fdc670bfbc01" width="500">

## Funds

### SIPs

Key-features: date for next installment, easy to read layout, hover over icon for label

<img src="https://github.com/DeepanshKhurana/PositTableContest2024/assets/26517718/c06c0d69-b10c-49f0-8e1c-459016685411" width="500">

### Lumpsum

Key-features: easy to read layout, hover over icon for label

<img src="https://github.com/DeepanshKhurana/PositTableContest2024/assets/26517718/67226249-1d67-4f63-87e6-4bc3b3cd51cb" width="500">


