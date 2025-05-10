import pytesseract
from PIL import Image
import pyautogui
import sys

# Set path to tesseract executable
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

# Get region from AHK
x, y, w, h = map(int, sys.argv[1:])

# Screenshot region
img = pyautogui.screenshot(region=(x, y, w, h))

# Optional: upscale for better recognition
img = img.resize((img.width * 2, img.height * 2), Image.LANCZOS)

# OCR without whitelist (letters + numbers + punctuation)
custom_config = r'--oem 3 --psm 6'
text = pytesseract.image_to_string(img, config=custom_config)

print(text.strip())
