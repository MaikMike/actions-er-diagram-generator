import os
from eralchemy import render_er

db_url = os.getenv('DB_URL')
output_file = os.getenv('OUTPUT_FILE')
if not db_url or not output_file:
    raise ValueError("Not all required parameters were provided")

render_er(db_url, output_file)

print(f"Diagrama ER generated: {output_file}")