import requests
from bs4 import BeautifulSoup
import pandas as pd
import os

# URL of Snapdeal Men's Sports Shoes
url = "https://www.snapdeal.com/products/mens-sports-shoes"

# Add headers to look like a browser
headers = {"User-Agent": "Mozilla/5.0"}

# Get the page
response = requests.get(url, headers=headers)
soup = BeautifulSoup(response.text, "lxml")

# Find all product cards
products = soup.find_all("div", class_="product-tuple-listing")

data = []

for p in products:
    name = p.find("p", class_="product-title")
    price = p.find("span", class_="product-price")
    orig_price = p.find("span", class_="lfloat product-desc-price strike")
    discount = p.find("div", class_="product-discount")

    data.append({
        "Name": name.get_text(strip=True) if name else None,
        "Discounted Price": price.get_text(strip=True) if price else None,
        "Original Price": orig_price.get_text(strip=True) if orig_price else None,
        "Discount %": discount.get_text(strip=True) if discount else None
    })

# ✅ Save to Downloads folder
downloads_path = os.path.join(os.path.expanduser("~"), "Downloads", "sports_shoes.csv")
df = pd.DataFrame(data)
df.to_csv(downloads_path, index=False, encoding="utf-8-sig")

print(f"✅ Data saved to {downloads_path}")
print(df.head()) 