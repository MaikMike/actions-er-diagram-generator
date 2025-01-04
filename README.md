# ER Diagram Generator Action

This action generates an Entity-Relationship (ER) diagram from a SQL database schema. The diagram is saved as an image file as artifact so later you can save automatically the ER diagram in your project docs.

## Usage

### Generate ER diagram and save image as artifact

```yml
on:
  push:
    branches:
      - main

jobs:
  generate-diagram:
    runs-on: ubuntu-latest

    steps:
      - name: Generate ER Diagram using custom action
        uses: MaikMike/actions-er-diagram-generator@v1
        with:
          DB_URL: ${{ secrets.DB_URL }} # "postgresql://user:password@host/db"
          OUTPUT_FILE: "er_diagram.png"

      - name: Upload ER Diagram as artifact
        uses: actions/upload-artifact@v3
        with:
          name: er-diagram
          path: er_diagram.png
```

# Run in local

Alternative if you want to run in local can follow above steps

## Requirements

Before running this project, ensure that you have the following installed:

- Docker (for building and running the container)

## Getting Started

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/MaikMike/actions-er-diagram-generator.git
cd actions-er-diagram-generator
```

### 2. Build and run docker image

```bash
docker build -t er-diagram-generator .
docker run \
        -e DB_URL="postgresql://<USER>:<PASSWORD>@<HOST>/<DB>" \
        -e OUTPUT_FILE="your_output.png" \
        -v $(pwd):/app \
        er-diagram-generator
```
